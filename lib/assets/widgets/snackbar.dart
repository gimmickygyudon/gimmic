import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../functions/platform.dart';
import '../functions/url.dart';
import 'dialog.dart';

final GlobalKey<ScaffoldMessengerState> rootScaffoldMessengerKey =
    GlobalKey<ScaffoldMessengerState>();
bool expandedSnackbar = true;

SnackBar snackbarOpenLoading(String message,
    [Duration duration = const Duration(seconds: 2)]) {
  return SnackBar(
    duration: duration,
    behavior: SnackBarBehavior.floating,
    clipBehavior: Clip.antiAlias,
    content: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Transform.scale(
            scale: 0.5,
            child: const CircularProgressIndicator(
                color: Colors.blue, strokeWidth: 6)),
        Text(message),
      ],
    ),
    padding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    width: 350,
  );
}

SnackBar snackbarPaletteLoading(String message,
    [Duration duration = const Duration(minutes: 15)]) {
  return SnackBar(
    duration: duration,
    behavior: SnackBarBehavior.floating,
    clipBehavior: Clip.antiAlias,
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
        const LinearProgressIndicator(
            color: Colors.purple, backgroundColor: Colors.transparent),
      ],
    ),
    padding: const EdgeInsets.fromLTRB(12, 10, 12, 0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    width: 400,
  );
}

SnackBar snackbarPaletteComplete(String message,
    [Duration duration = const Duration(seconds: 4)]) {
  return SnackBar(
    duration: duration,
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        const Icon(Icons.done, color: Colors.green),
        const SizedBox(width: 10),
        Text(message),
      ],
    ),
    padding: isWebMobile
        ? const EdgeInsets.fromLTRB(12, 0, 2, 0)
        : const EdgeInsets.fromLTRB(12, 8, 2, 8),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    width: 350,
    action: SnackBarAction(
      label: 'OK',
      onPressed: () {
        // Some code to undo the change.
      },
    ),
  );
}

SnackBar snackbarCopyItem(BuildContext context, item,
    [Duration duration = const Duration(seconds: 5)]) {
  return SnackBar(
    duration: duration,
    backgroundColor: Colors.grey.shade50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    padding: EdgeInsets.zero,
    margin:
        EdgeInsets.fromLTRB(25, 5, MediaQuery.of(context).size.width - 450, 20),
    content: Theme(
      data: ThemeData(useMaterial3: true)
          .copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        horizontalTitleGap: 0,
        minLeadingWidth: 36,
        child: ExpansionTile(
          initiallyExpanded: expandedSnackbar,
          onExpansionChanged: (value) => expandedSnackbar = value,
          childrenPadding: EdgeInsets.zero,
          leading: Icon(Icons.content_paste_go,
              color: Colors.blue.shade700, size: 20),
          trailing: const Icon(Icons.info, size: 20),
          title: Text('Links Copied to Clipboard',
              style: GoogleFonts.roboto(
                  color: Colors.blue.shade700, fontWeight: FontWeight.w500)),
          children: <Widget>[
            InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                urlLink(context, item);
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
              },
              child: ListTile(
                  contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  horizontalTitleGap: 20,
                  title: Text(item,
                      style: GoogleFonts.roboto(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      )),
                  trailing: TextButton.icon(
                      icon: const Icon(Icons.open_in_new, size: 18),
                      onPressed: () {
                        urlLink(context, item);
                        ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      },
                      label: const Text('Open'))),
            ),
          ],
        ),
      ),
    ),
    behavior: SnackBarBehavior.floating,
  );
}

SnackBar snackbarCopyImage(BuildContext context, image, hero,
    [Duration duration = const Duration(seconds: 5)]) {
  return SnackBar(
    duration: duration,
    backgroundColor: Colors.grey.shade50,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
    padding: const EdgeInsets.fromLTRB(2, 0, 2, 1),
    clipBehavior: Clip.antiAlias,
    margin:
        EdgeInsets.fromLTRB(25, 5, MediaQuery.of(context).size.width - 325, 20),
    content: Theme(
      data: ThemeData(useMaterial3: true)
          .copyWith(dividerColor: Colors.transparent),
      child: ListTileTheme(
        horizontalTitleGap: 0,
        child: ExpansionTile(
          initiallyExpanded: expandedSnackbar,
          onExpansionChanged: (value) => expandedSnackbar = value,
          leading: Icon(Icons.content_paste_go,
              color: Colors.blue.shade700, size: 20),
          trailing: const Icon(Icons.info, size: 20),
          title: Text('Image Copied',
              style: GoogleFonts.roboto(
                  color: Colors.blue.shade700, fontWeight: FontWeight.w500)),
          children: <Widget>[
            InkWell(
              mouseCursor: SystemMouseCursors.click,
              onTap: () {
                if (hero != null) {
                  imageDialogHero(context, image, hero, null);
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                }
              },
              child: SizedBox(
                height: 200,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(6),
                            bottomRight: Radius.circular(6)),
                        child:
                            Image(image: AssetImage(image), fit: BoxFit.cover)),
                    Center(
                      child: ElevatedButton.icon(
                          style: ButtonStyle(
                            minimumSize: const MaterialStatePropertyAll(
                                Size(double.infinity, double.infinity)),
                            shape: const MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(6),
                                        bottomRight: Radius.circular(6)))),
                            elevation: const MaterialStatePropertyAll(0),
                            backgroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return hero != null
                                      ? Colors.black38
                                      : Colors.transparent;
                                }
                                return Colors.transparent;
                              },
                            ),
                            foregroundColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (states) {
                                if (states.contains(MaterialState.hovered)) {
                                  return hero != null
                                      ? Colors.lightBlue.shade100
                                      : Colors.transparent;
                                }
                                return Colors.transparent;
                              },
                            ),
                          ),
                          icon: const Icon(
                            Icons.fullscreen_rounded,
                            size: 20,
                            shadows: [
                              Shadow(
                                  color: Colors.black54,
                                  offset: Offset(1, 1),
                                  blurRadius: 2),
                            ],
                          ),
                          onPressed: () {
                            if (hero != null) {
                              imageDialogHero(context, image, hero, null);
                              return ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                            }
                          },
                          label: Text('Open in Fullscreen Mode',
                              style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.w400))),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
    behavior: SnackBarBehavior.floating,
  );
}
