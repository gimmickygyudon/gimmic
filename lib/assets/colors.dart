import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:palette_generator/palette_generator.dart';

List paletteMutedColors = [],
    paletteVibrantColors = [],
    paletteDominantColors = [];

Future<void> updatePaletteGen(images) async {
  for (String picture in images) {
    Uint8List imageData = (await rootBundle.load(picture)).buffer.asUint8List();

    final PaletteGenerator generator =
        await PaletteGenerator.fromImageProvider(MemoryImage(imageData));

    paletteMutedColors.add(generator.lightMutedColor);

    if (generator.lightVibrantColor != null) {
      paletteVibrantColors.add(generator.lightVibrantColor);
    } else {
      paletteVibrantColors.add(generator.lightMutedColor);
    }

    if (generator.dominantColor != null) {
      paletteDominantColors.add(generator.dominantColor);
    } else {
      paletteDominantColors.add(generator.lightMutedColor);
    }
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
