import 'package:flutter/material.dart';

Widget imageDialog(context, images, pagePosition) {
  return Dialog(
    backgroundColor: Colors.transparent,
    child: InteractiveViewer(
      panEnabled: false,
      minScale: 0.5,
      maxScale: 4,
      child: GestureDetector(
        onTap: () => Navigator.pop(context, false), // passing false
        child: Image(
          image: pagePosition == null
              ? AssetImage(images)
              : AssetImage(images[pagePosition]),
          fit: BoxFit.contain,
        ),
      ),
    ),
  );
}
