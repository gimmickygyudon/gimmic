import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:google_fonts/google_fonts.dart';

Widget chipTag(iconsize, fontsize,
    [int selectedIndex = -1,
    int index = 0,
    String label = 'Animal',
    IconData icon = Icons.cruelty_free]) {
  return FilterChip(
    visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
    onSelected: (value) {},
    avatar: Icon(icon, size: iconsize, color: Colors.black54),
    labelStyle: GoogleFonts.roboto(
      fontWeight: FontWeight.w700,
      fontSize: fontsize,
      letterSpacing: 0.5,
      color: Colors.black54,
    ),
    labelPadding: const EdgeInsets.only(right: 12),
    label: Text(label),
    padding: EdgeInsets.zero,
    backgroundColor: selectedIndex == index ? Colors.green.shade50 : null,
    side: BorderSide.none,
  );
}

Widget chipTagOutlined(name, icon, color, iconsize, fontsize) {
  return FilterChip(
      visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
      onSelected: (value) {},
      avatar: Icon(icon, size: iconsize, color: Colors.black54),
      labelStyle: GoogleFonts.roboto(
          fontWeight: isWebMobile ? FontWeight.w600 : FontWeight.w700,
          fontSize: fontsize,
          letterSpacing: 0.5,
          color: Colors.black54),
      label: Text(name),
      labelPadding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      backgroundColor: color,
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 4));
}
