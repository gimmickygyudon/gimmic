import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Color colorButtonLuminance(Color color,
    [double darkamount = .5, double lightamount = .2]) {
  final colors = lighten(color, lightamount).computeLuminance() > 0.65
      ? darken(color, darkamount)
      : lighten(color, lightamount);
  return colors;
}

Color colorLuminance(Color color, [double amount = .1, double percent = .5]) {
  final luminance = lighten(color, amount).computeLuminance();

  final palette = luminance > percent
      ? lighten(color, amount).computeLuminance() > .95
          ? darken(color, amount / (amount * 3))
          : darken(color, amount / (amount * 30))
      : darken(color, amount).computeLuminance() < .05
          ? lighten(color, amount / (amount * 10))
          : lighten(color, amount * luminance);
  return palette;
}

// [DEPRECATED]
Color colorLightText(Color color, [double amount = .1, double percent = .5]) {
  final luminance = lighten(color, amount).computeLuminance();

  final palette = luminance > percent
      ? lighten(color, amount).computeLuminance() < .95
          ? lighten(color, amount)
          : lighten(color, amount / (amount * 1.25))
      : lighten(color, amount).computeLuminance() > .95
          ? lighten(color, amount / (amount * 1.25))
          : darken(color, amount);
  return palette;
}

Color colorLight(Color color, [double amount = .8, double power = .45]) {
  double luminance = lighten(color, power).computeLuminance();
  Color palette = color;

  if (luminance < amount)
  {
    for (var i = luminance; i < amount; power += .01) {
      if (power > 1) break;

      palette = lighten(color, power);
      i = palette.computeLuminance();
    } 
  } else if (luminance > amount) {
    for (var i = luminance; i > amount; power -= .01) {
      if (power < 0) break;

      palette = lighten(color, power);
      i = palette.computeLuminance();
    }

    // Input color might be too bright -> try darken the color.
    if (power < 0) {
      power = 0;
      debugPrint('darkening the color');
      for (var i = luminance; i > amount; power += .01) {
        if (power > 1) break;

        palette = darken(color, power);
        i = palette.computeLuminance();
      }
    }
  } else {
    palette = lighten(color, power);
  }

  return palette;
}

Color colorLightButton(Color color, [double amount = .75, double power = .45]) {
  return colorLight(color, amount, power);
}

Color colorDark(Color color, [double amount = .1, double percent = .5]) {
  final luminance = darken(color, amount).computeLuminance();

  final palette = luminance < percent
      ? darken(color, amount).computeLuminance() < .05
          ? darken(color, amount / (amount * 3))
          : darken(color, .05)
      : darken(color, amount).computeLuminance() > .05
          ? darken(color, amount / (amount * 3))
          : darken(color, amount);
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
