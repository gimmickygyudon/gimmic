import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget appbarSetting(layout) {
  return Row(
    children: [
      AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: layout
              ? IntrinsicHeight(
                  child: Row(children: [
                    TextButton.icon(
                      icon: const Icon(Icons.light_mode_rounded, size: 20),
                      onPressed: null,
                      label: Text(
                        'Light Mode',
                        style: GoogleFonts.roboto(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                        width: 20,
                        indent: 9,
                        endIndent: 9,
                        color: Colors.black38)
                  ]),
                )
              : null),
      const IconButton(
        icon: Icon(Icons.settings_outlined),
        onPressed: null,
      ),
      const IconButton(
        icon: Icon(Icons.account_circle),
        onPressed: null,
      ),
    ],
  );
}
