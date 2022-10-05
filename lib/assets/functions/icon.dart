import 'package:flutter/material.dart';

extension IconStringExt on String {
  IconData? get iconParse => {
        "Icons.directions_car_outlined": Icons.airport_shuttle_outlined,
      }[this];
}
