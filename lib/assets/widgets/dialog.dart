import 'package:flutter/material.dart';

imageDialogHero(context, images, arguments, pagePosition) {
  Navigator.of(context).push(PageRouteBuilder(
      fullscreenDialog: true,
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
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Hero(
              tag: pagePosition == null
                  ? arguments
                  : arguments['hero'] + pagePosition.toString(),
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 6,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Stack(children: [
                    Center(
                      child: Image(
                          image: pagePosition == null
                              ? AssetImage(images)
                              : AssetImage(images[pagePosition])),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(25.7)),
                        child: IconButton(
                            constraints: const BoxConstraints(minHeight: 48),
                            onPressed: () => Navigator.pop(context),
                            icon: const Icon(
                              Icons.close,
                              color: Colors.white,
                              size: 24,
                            )),
                      ),
                    ),
                  ]),
                ),
              ),
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
