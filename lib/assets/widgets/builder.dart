import 'package:flutter/material.dart';

Widget imageFrameBulilder(
    Widget child, int? frame, bool wasSynchronouslyLoaded) {
  if (wasSynchronouslyLoaded) {
    return child;
  }
  return AnimatedOpacity(
    opacity: frame == null ? 0 : 1,
    duration: const Duration(seconds: 1),
    curve: Curves.easeOut,
    child: child,
  );
}

Widget imageLoadingBuilder(Widget child, ImageChunkEvent? loadingProgress) {
  if (loadingProgress == null) {
    return child;
  }
  return LinearProgressIndicator(
    value: loadingProgress.expectedTotalBytes != null
        ? loadingProgress.cumulativeBytesLoaded /
            loadingProgress.expectedTotalBytes!
        : null,
  );
}
