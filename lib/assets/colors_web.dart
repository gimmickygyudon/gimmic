import 'dart:async';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:squadron/squadron.dart';
import 'worker/colors_web_service.dart';

class PaletteColorWeb {
  final Color color;
  final Color text;
  PaletteColorWeb(this.color, this.text);
}

Completer updatePaletteGenWebCompleter = Completer();
List<PaletteColorWeb> paletteDominantColorsWeb = [];

// TODO: Need Improvement on Color Sorting, Avarage Color, Computing Luminance
Future updatePaletteGenWeb(List images, [int noOfPixelsPerAxis = 12]) async {
  late ThumbnailWorkerPool? thumbnailWorkerPool;
  try {
    thumbnailWorkerPool = ThumbnailWorkerPool(const ConcurrencySettings(
        minWorkers: 1, maxWorkers: 4, maxParallel: 2));
    for (String picture in images) {
      Squadron.info('Loading image #$picture...');
      final sw = Stopwatch()..start();
      Uint8List imageData =
          (await rootBundle.load(picture)).buffer.asUint8List();

      /* THIS DONE IN ISOLATED PROCESS 
      ui.decodeImageFromList(imageData, (result) async {
        byteData = await result
            .toByteData(format: ui.ImageByteFormat.rawStraightRgba)
            .onError((error, stackTrace) {
          debugPrint('image to rawStraightRgba $error - $stackTrace');
          return null;
        });
      }); 
      */

      /* THIS DONE IN ISOLATED PROCESS 
      final codec = await ui.instantiateImageCodec(imageData);
      final frame = await codec.getNextFrame();
      final images = frame.image;
      final byteData = await images
          .toByteData(format: ui.ImageByteFormat.rawStraightRgba)
          .onError((error, stackTrace) {
        debugPrint('image to rawStraightRgba $error');
        return null;
      }); 
      */

      Image image = Image.asset(picture);
      Completer<ui.Image> completer = Completer<ui.Image>();
      image.image.resolve(const ImageConfiguration()).addListener(
          ImageStreamListener(
              (ImageInfo info, bool _) => completer.complete(info.image)));
      ui.Image info = await completer.future;
      int width = info.width;
      int height = info.height;

      final List generator = await thumbnailWorkerPool
          .getThumbnail(imageData, width, height)
          .whenComplete(() => Squadron.info('Worker pool #generator complete'));
      sw.stop();

      final PaletteColorWeb color =
          PaletteColorWeb(Color(generator.first), Color(generator.last));
      Squadron.info(
          '#generator items converted to ${color.color.toString()} and ${color.text.toString()}');

      paletteDominantColorsWeb.add(color);
    }
  } finally {
    for (var element in paletteDominantColorsWeb) {
      debugPrint(element.toString());
    }
    thumbnailWorkerPool?.stop();
    updatePaletteGenWebCompleter.complete();
  }
}

// this is where the stub file comes into action
//
// of course, if your application does not target both Web and VM platforms,
// you need not define a stub file and can go directly for your target platform
ThumbnailWorker createWorker() =>
    ThumbnailWorker('/workers/colors_web_worker.dart.js');

// Implementation of ThumbnailService as a Squadron worker pool
class ThumbnailWorkerPool extends WorkerPool<ThumbnailWorker>
    implements ThumbnailService {
  ThumbnailWorkerPool(ConcurrencySettings concurrencySettings)
      : super(createWorker, concurrencySettings: concurrencySettings);

  @override
  Future getThumbnail(Uint8List imagedata, int width, int height) =>
      execute((w) => w.getThumbnail(imagedata, width, height));
}

// Implementation of ThumbnailService as a Squadron worker
class ThumbnailWorker extends Worker implements ThumbnailService {
  ThumbnailWorker(dynamic entryPoint, {List args = const []})
      : super(entryPoint, args: args);

  @override
  Future getThumbnail(Uint8List imagedata, int width, int height) =>
      send(ThumbnailService.getThumbnailCommand,
          args: [imagedata, width, height]);
}
