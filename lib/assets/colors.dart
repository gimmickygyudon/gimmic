import 'dart:async';
import 'dart:isolate';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

Completer updatePaletteGenCompleter = Completer();
List paletteMutedColors = [],
    paletteVibrantColors = [],
    paletteDominantColors = [];

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

  isolatePaletteReceivePort.listen((message) {
    if (message == 'complete') {
      debugPrint('complete');
      isolatePaletteReceivePort.close();
    } else {
      final PaletteGenerator generator = message;

      paletteMutedColors.add(generator.lightMutedColor);

      generator.lightVibrantColor != null
          ? paletteVibrantColors.add(generator.lightVibrantColor)
          : paletteVibrantColors.add(generator.lightMutedColor);

      generator.dominantColor != null
          ? paletteDominantColors.add(generator.dominantColor)
          : paletteDominantColors.add(generator.lightMutedColor);
    }
  }).onDone(() {
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
    Uint8List image = message[0];
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

Color colorButtonLuminance(Color color, [darkamount = .5, lightamount = .2]) {
  final colors = lighten(color, lightamount).computeLuminance() > 0.85
      ? darken(color, darkamount)
      : lighten(color, lightamount);
  return colors;
}

Color colorLuminance(double amount, luminance, Color color, double percent) {
  final palette = luminance(color, percent).computeLuminance() > amount
      ? luminance(color, percent / 2)
      : luminance(color, percent);
  return palette;
}

/// Darken a color by [percent] amount (100 = black)
// ........................................................
Color darkening(Color c, [double percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var f = 1 - percent / 100;
  return Color.fromARGB(c.alpha, (c.red * f).round(), (c.green * f).round(),
      (c.blue * f).round());
}

/// Lighten a color by [percent] amount (100 = white)
// ........................................................
Color lightening(Color c, [double percent = 10]) {
  assert(1 <= percent && percent <= 100);
  var p = percent / 100;
  return Color.fromARGB(
      c.alpha,
      c.red + ((255 - c.red) * p).round(),
      c.green + ((255 - c.green) * p).round(),
      c.blue + ((255 - c.blue) * p).round());
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}
