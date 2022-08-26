import 'package:flutter/material.dart';

imageDialogHero(context, images, arguments, pagePosition) {
  Navigator.of(context).push(PageRouteBuilder(
      opaque: false,
      barrierDismissible: true,
      barrierColor: Colors.black54,
      transitionDuration: const Duration(milliseconds: 200),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        final tween = Tween(begin: begin, end: end);
        final offsetAnimation = animation.drive(tween);
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      pageBuilder: (BuildContext context, animation, secondaryAnimation) {
        return Hero(
          tag: pagePosition == null
              ? arguments
              : arguments['hero'] + pagePosition.toString(),
          child: InteractiveViewer(
            panEnabled: true,
            minScale: 1,
            maxScale: 6,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image(
                  image: pagePosition == null
                      ? AssetImage(images)
                      : AssetImage(images[pagePosition])),
            ),
          ),
        );
      }));
}

imageDialog(context, images, pagePosition) {
  showGeneralDialog(
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    context: context,
    pageBuilder: (context, animation, secondaryAnimation) {
      return Padding(
        padding: const EdgeInsets.all(0.0),
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 1,
          maxScale: 6,
          child: GestureDetector(
            onTap: () => Navigator.pop(context, false), // passing false
            child: Image(
              image: pagePosition == null
                  ? AssetImage(images)
                  : AssetImage(images[pagePosition]),
            ),
          ),
        ),
      );
    },
  );
}
