import 'dart:async';
import 'dart:convert';
import 'dart:ui' as ui;
import 'package:async/async.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:gimmic/assets/functions/string.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:squadron/squadron.dart';
import 'worker/colors_web_service.dart';

class PaletteColorWeb {
  final Color color;
  final Color text;
  PaletteColorWeb(this.color, this.text);
}

List<PaletteColorWeb> paletteMutedColors = [],
    paletteVibrantColors = [],
    paletteDominantColors = [];

List<PaletteColorWeb> paletteMuted = [],
    paletteVibrant = [],
    paletteDominant = [];

List list = [];

bool snackbarbinding = false;
bool loadingpalette = false;
bool palettecache = false; 

final token = CancellationToken();
final CancelableOperation cancelableFuture = CancelableOperation.fromFuture(
  updatePaletteGen(list, '', null, Completer.sync()),
  onCancel: () {
    token.cancel();
    Squadron.info('Palette generation canceled... cancelableFuture called()');
  },
);

void resetPalette() {
  paletteMutedColors.clear();
  paletteVibrantColors.clear();
  paletteDominantColors.clear();
  paletteMuted.clear();
  paletteVibrant.clear();
  paletteDominant.clear();
}

Future updatePaletteGen(List images, String blob, snackbar, Completer updatePaletteGenCompleter, [int noOfPixelsPerAxis = 12]) async {
  final prefs = await SharedPreferences.getInstance();
  if (prefs.getString(blob) != null) {
    try {
      palettecache = true;
      final data = prefs.getString(blob) ?? '';

      final jsonData = jsonDecode(data);
      print("$blob: $jsonData");
    
      // TODO:Need to add other text colors

      for (var element in jsonData) {
        paletteDominantColors.add(PaletteColorWeb(
          Color(int.parse(element['paletteDominant']!)), Color(int.parse(element['paletteDominant']!))));
        paletteVibrantColors.add(PaletteColorWeb(
          Color(int.parse(element['paletteVibrant']!)), Color(int.parse(element['paletteVibrant']!))));
        paletteMutedColors.add(PaletteColorWeb(
          Color(int.parse(element['paletteMuted']!)), Color(int.parse(element['paletteMuted']!))));
      }

    } catch (e) {
      debugPrint("catch: ${e.toString()}");
    } finally {

      loadingpalette = false;
      updatePaletteGenCompleter.complete();         

    }
  } else {
    late ThumbnailWorkerPool? thumbnailWorkerPool;
    debugPrint('Future #updatePaletteGen passed');
    snackbar();
    try {
      thumbnailWorkerPool = ThumbnailWorkerPool(const ConcurrencySettings(
          minWorkers: 1, maxWorkers: 4, maxParallel: 2));
      thumbnailWorkerPool.start();
      loadingpalette = true;
      Squadron.info('thumbnailWorkerPool.start()');
      for (Uint8List picture in images) {
        Squadron.info('Loading image #$picture...');
        final sw = Stopwatch()..start();
        Uint8List imageData = picture;

        Image image = Image.memory(picture);
        Completer<ui.Image> completer = Completer<ui.Image>();
        image.image.resolve(const ImageConfiguration()).addListener(
            ImageStreamListener(
                (ImageInfo info, bool _) => completer.complete(info.image)));
        ui.Image info = await completer.future;
        int width = info.width;
        int height = info.height;

        final List generator = await thumbnailWorkerPool
            .getThumbnail(
                imagedata: imageData, width: width, height: height, token: token)
            .whenComplete(() => Squadron.info('Worker pool #generator complete'));
        sw.stop();

        final PaletteColorWeb colorDominant =
            PaletteColorWeb(Color(generator.last), Color(generator.first));
        // Squadron.info('#generator items converted to #colorDominant ${colorDominant.color.toString()} and ${colorDominant.text.toString()}');

        final PaletteColorWeb colorMuted =
            PaletteColorWeb(Color(generator.first), Color(generator.last));
        // Squadron.info('#generator items converted to #colorMuted ${colorMuted.color.toString()} and ${colorMuted.text.toString()}');

        final PaletteColorWeb colorVibrant = PaletteColorWeb(
            Color(generator.elementAt((generator.length / 3.5).round())),
            Color(generator.last));
        // Squadron.info('#generator items converted to #colorVibrant ${colorVibrant.color.toString()} and ${colorVibrant.text.toString()}');

        paletteDominant.add(colorDominant);
        paletteMuted.add(colorMuted);
        paletteVibrant.add(colorVibrant);
      }
    } catch (exception) {
      debugPrint(exception.toString());
    } finally {
      List<Map<String, dynamic>> data = [];

      if (paletteVibrant[0].color.computeLuminance() <
          paletteDominant[0].color.computeLuminance()) {
        paletteVibrantColors.addAll(paletteVibrant);
        paletteDominantColors.addAll(paletteDominant);
      } else {
        paletteVibrantColors.addAll(paletteDominant);
        paletteDominantColors.addAll(paletteVibrant);
      }
      paletteMutedColors.addAll(paletteMuted);
      thumbnailWorkerPool?.stop();
      Squadron.info('WorkerPool finished...');

      // TODO:Need Improvements and to add text colors
      int i = 0;
      for (var element in paletteVibrantColors) {
        data.add({ 
          "paletteVibrant": element.color.toString().toColorHex(),
          "paletteDominant": paletteDominantColors[i].color.toString().toColorHex(),
          "paletteMuted": paletteMutedColors[i].color.toString().toColorHex()
        });

        i += 1;
        // print(element.color.toString().toColorHex());
      }
      // print("data: $data");
      final jsonData = jsonEncode(data);
      // print("jsonData: $jsonData");

      loadingpalette = false;
      updatePaletteGenCompleter.complete();

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(blob, jsonData);
    }
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
  Future getThumbnail(
          {required Uint8List imagedata,
          required int width,
          required int height,
          CancellationToken? token}) =>
      execute((w) => w.getThumbnail(
          imagedata: imagedata, width: width, height: height, token: token));
}

// Implementation of ThumbnailService as a Squadron worker
class ThumbnailWorker extends Worker implements ThumbnailService {
  ThumbnailWorker(dynamic entryPoint, {List args = const []})
      : super(entryPoint, args: args);

  @override
  Future getThumbnail(
          {required Uint8List imagedata,
          required int width,
          required int height,
          CancellationToken? token}) =>
      send(ThumbnailService.getThumbnailCommand,
          args: [imagedata, width, height], token: token);
}
