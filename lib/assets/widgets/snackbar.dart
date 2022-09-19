import 'package:flutter/material.dart';

/* import '../../assets/colors.dart'
    if (dart.library.js) '../../assets/colors_web.dart'
    if (dart.library.html) '../../assets/colors_web.dart'
    if (dart.library.io) '../../assets/colors.dart'; */

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();

SnackBar snackbarPaletteLoading(String message,
    [Duration duration = const Duration(minutes: 15)]) {
  final snackbar = SnackBar(
    duration: duration,
    behavior: SnackBarBehavior.floating,
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        /* Transform.scale(
            scale: 0.7,
            child: const CircularProgressIndicator(color: Colors.purple)),
        const SizedBox(width: 10), */
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.info_outline, color: Colors.blue),
            const SizedBox(width: 10),
            Text(message),
          ],
        ),
        const SizedBox(height: 8),
        const LinearProgressIndicator(color: Colors.purple),
      ],
    ),
    padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    width: 400,
  );

  return snackbar;
}

SnackBar snackbarPaletteComplete(String message,
    [Duration duration = const Duration(seconds: 4)]) {
  final snackbar = SnackBar(
    duration: duration,
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        const Icon(Icons.done, color: Colors.green),
        const SizedBox(width: 10),
        Text(message),
      ],
    ),
    padding: const EdgeInsets.fromLTRB(12, 12, 2, 12),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    width: 400,
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );

  return snackbar;
}
