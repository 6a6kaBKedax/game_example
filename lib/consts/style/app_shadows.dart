import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> bigShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.55),
      offset: const Offset(0.0, 13.58),
      blurRadius: 9.05,
    )
  ];
  static List<BoxShadow> mediumShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.55),
      offset: const Offset(0.0, 9.25),
      blurRadius: 6.17,
    )
  ];

  static const List<BoxShadow> mediumShadowBlue = [
    BoxShadow(
      color: Color(0xFF00FFC2),
      offset:  Offset(0.0, 10.0),
      blurRadius: 20.0,
    )
  ];

  static  List<BoxShadow> smallShadow = [
    BoxShadow(
      color: Colors.black.withOpacity(0.45),
      offset:  const Offset(0.0, 5.0),
      blurRadius: 5.0,
    )
  ];
}
