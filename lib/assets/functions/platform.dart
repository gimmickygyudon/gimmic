// import 'dart:ui';
import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';

final isWebMobile = kIsWeb &&
    (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.android);

/// Extension method that helps with working with the hinge directly.
/* extension MediaQueryHinge on MediaQueryData {
  DisplayFeature? get hinge {
    for (final DisplayFeature e in displayFeatures) {
      if (e.type == DisplayFeatureType.hinge) {
        return e;
      }
    }
    return null;
  }
} */
