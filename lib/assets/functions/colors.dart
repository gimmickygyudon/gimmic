import 'package:flutter/material.dart';

class ShimmerLoading extends StatefulWidget {
  static ShimmerLoadingState? of(BuildContext context) {
    return context.findAncestorStateOfType<ShimmerLoadingState>();
  }

  const ShimmerLoading({
    super.key,
    required this.isLoading,
    required this.child,
    this.duration = const Duration(seconds: 1),
    this.curve = Curves.ease,
    required this.border,
    this.margin = EdgeInsets.zero,
    this.padding = EdgeInsets.zero,
    required this.builder
  });

  final bool isLoading;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final BorderRadius border;
  final EdgeInsets margin, padding;
  final Widget builder;

  @override
  State<ShimmerLoading> createState() => ShimmerLoadingState();
}

class ShimmerLoadingState extends State<ShimmerLoading> with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  Listenable get shimmerChanges => _shimmerController;
  Listenable? _shimmerChanges;
  LinearGradient? shimmerGradient;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_shimmerChanges != null) {
      _shimmerChanges!.removeListener(_onShimmerChange);
    }
    _shimmerChanges = ShimmerLoading.of(context)?.shimmerChanges;
    if (_shimmerChanges != null) {
      _shimmerChanges!.addListener(_onShimmerChange);
    }

  }

  @override
  void initState() {
    super.initState();
    _shimmerController = AnimationController.unbounded(
      vsync: this, 
    )..repeat(min: -0.5, max: 1.5, period: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    _shimmerChanges?.removeListener(_onShimmerChange);
    super.dispose();
  }

  void _onShimmerChange() {
    if (widget.isLoading) {
      setState(() {
        // update the shimmer painting.
      });
    }
  }

  Future<void> _onShimmerStop() async {
    if(!widget.isLoading) {
        _shimmerController.stop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: widget.duration,
      switchInCurve: widget.curve,
      switchOutCurve: widget.curve,
      child: (() {
        _onShimmerStop();
        return widget.isLoading 
          ? AnimatedBuilder(
              animation: _shimmerController,
              child: widget.builder,
              builder: (context, child) {
                return ShaderMask(
                    blendMode: BlendMode.srcATop,
                    shaderCallback: (bounds) {
                      return LinearGradient(
                        colors: [
                          Colors.grey.shade300.withOpacity(0.6),
                          Colors.grey.shade200.withOpacity(0.9),
                          Colors.grey.shade300.withOpacity(0.6),
                        ],
                        stops: const [
                          0.1,
                          0.3,
                          0.4,
                        ],
                        begin: const Alignment(-1.0, -0.3),
                        end: const Alignment(1.0, 0.3),
                        transform: _SlidingGradientTransform(slidePercent: _shimmerController.value),
                      ).createShader(bounds);
                    },
                    child: widget.builder 
                );
              }
            )
          : widget.child;
      }())
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}



// [DEPRECATED]
Color colorButtonLuminance(Color color,
    [double darkamount = .5, double lightamount = .2]) {
  final colors = lighten(color, lightamount).computeLuminance() > 0.65
      ? darken(color, darkamount)
      : lighten(color, lightamount);
  return colors;
}

// [DEPRECATED]
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

  if (luminance < amount) {
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
      // debugPrint('darkening the color');
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

// [DEPRECATED]
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
