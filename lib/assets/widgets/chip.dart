import 'package:flutter/material.dart';
import 'package:gimmic/assets/functions/platform.dart';
import 'package:google_fonts/google_fonts.dart';

Widget chipTag(iconsize, fontsize) {
  return FilterChip(
    visualDensity: const VisualDensity(horizontal: -2, vertical: -2),
    onSelected: (value) {},
    avatar: Icon(Icons.pets_rounded, size: iconsize, color: Colors.black54),
    labelStyle: GoogleFonts.roboto(
      fontWeight: FontWeight.w700,
      fontSize: fontsize,
      letterSpacing: 0.5,
      color: Colors.black54,
    ),
    labelPadding: const EdgeInsets.only(right: 12),
    label: const Text('Animal'),
    pressElevation: 2,
    padding: EdgeInsets.zero,
    side: const BorderSide(width: 0, color: Colors.transparent),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
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
      labelPadding: const EdgeInsets.only(left: 0, right: 10),
      backgroundColor: color,
      side: const BorderSide(color: Colors.black12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      padding: const EdgeInsets.symmetric(horizontal: 4));
}
