import 'dart:async';
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

Completer updatePaletteGenCompleter = Completer();
List paletteMutedColors = [],
    paletteVibrantColors = [],
    paletteDominantColors = [];

List list = [];
bool palettecache = false;
bool loadingpalette = false;
CancelableOperation cancelableFuture = CancelableOperation.fromFuture(
  updatePaletteGen(list),
  onCancel: () {
    debugPrint('Palette generation canceled... cancelableFuture called()');
  },
);

Future updatePaletteGen(List images) async {
  /// Where I listen to the message from isolate's port
  ReceivePort paletteGenReceivePort = ReceivePort();

  /// Spawn an isolate, passing my receivePort sendPort
  final isolate = await Isolate.spawn<SendPort>(
      createIsolatePalette, paletteGenReceivePort.sendPort);

  /// isolate palette sends a senderPort for me to enable me to send him a
  /// message via his sendPort.
  /// I receive Mike's senderPort via my receivePort
  SendPort isolatePalettePort = await paletteGenReceivePort.first;

  /// I set up another receivePort to receive isolate's response.
  ReceivePort isolatePaletteReceivePort = ReceivePort();

  /// I send isolate palette a message using isolatePalettePort. I send him a list,
  /// which includes my message, preferred type of coffee, and finally
  /// a sendPort from isolatePaletteReceivePort that enables isolate palette
  /// to send a message back to me.
  final length = images.length;
  for (String picture in images) {
    Uint8List imageData = (await rootBundle.load(picture)).buffer.asUint8List();

    final codec = await ui.instantiateImageCodec(imageData);
    final frame = await codec.getNextFrame();
    final images = frame.image;
    final byteData =
        await images.toByteData(format: ui.ImageByteFormat.rawStraightRgba);

    Image image = Image.asset(picture);
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener(
            (ImageInfo info, bool _) => completer.complete(info.image)));
    ui.Image info = await completer.future;
    int width = info.width;
    int height = info.height;

    isolatePalettePort.send([
      imageData,
      width,
      height,
      byteData,
      isolatePaletteReceivePort.sendPort,
      length,
    ]);
  }

  List paletteMuted = [], paletteVibrant = [], paletteDominant = [];
  isolatePaletteReceivePort.listen((message) {
    if (message == 'complete') {
      debugPrint('complete');
      isolatePaletteReceivePort.close();
    } else {
      final PaletteGenerator generator = message;

      paletteMuted.add(generator.lightMutedColor);

      generator.lightVibrantColor != null
          ? paletteVibrant.add(generator.lightVibrantColor)
          : paletteVibrant.add(generator.lightMutedColor);

      generator.dominantColor != null
          ? paletteDominant.add(generator.dominantColor)
          : paletteDominant.add(generator.lightMutedColor);
    }
  }).onDone(() {
    paletteMutedColors.addAll(paletteMuted);
    paletteVibrantColors.addAll(paletteVibrant);
    paletteDominantColors.addAll(paletteDominant);

    isolate.kill(priority: Isolate.immediate);
    updatePaletteGenCompleter.complete();
  });
}

Future<void> createIsolatePalette(SendPort isolateSendPort) async {
  /// Set up a receiver port for isolate palette
  ReceivePort isolateReceivePort = ReceivePort();

  /// Send isolate palette receivePort sendPort via mySendPort
  isolateSendPort.send(isolateReceivePort.sendPort);

  /// Listen to messages sent to isolate's receive port
  int i = 1;
  await for (var message in isolateReceivePort) {
    int width = message[1];
    int height = message[2];
    ByteData byteData = message[3];

    final PaletteGenerator generator = await PaletteGenerator.fromByteData(
        EncodedImage(byteData, width: width, height: height));

    /// Get isolate's response sendPort
    final SendPort isolatePaletteSendPort = message[4];

    /// Send isolate's response via isolatePaletteSendPort
    isolatePaletteSendPort.send(generator);
    debugPrint(message[5].toString());
    debugPrint(i.toString());

    if (i == message[5]) {
      debugPrint('complete');
      isolatePaletteSendPort.send('complete');
    }
    i++;
  }
}
