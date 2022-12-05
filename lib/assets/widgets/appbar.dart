import 'package:flutter/material.dart';

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
                      label: const Text(
                        'Light Mode',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const VerticalDivider(
                        width: 20,
                        indent: 10,
                        endIndent: 10,
                        color: Colors.black38)
                  ]),
                )
              : null),
      const IconButton(
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.settings_outlined),
        onPressed: null,
      ),
      const IconButton(
        visualDensity: VisualDensity.compact,
        icon: Icon(Icons.account_circle),
        onPressed: null,
      ),
    ],
  );
}
