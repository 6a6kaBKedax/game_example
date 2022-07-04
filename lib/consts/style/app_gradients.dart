import 'package:flutter/material.dart';

class AppGradients {
  static const LinearGradient greenToDarkGreenGradient = LinearGradient(
    colors: [
      Color(0xff104438),
      Color(0xff22944F),
      Color(0xff59DA44),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const LinearGradient darkGreenToLightGreenGradient = LinearGradient(
    colors: [
      Color(0xff09513F),
      Color(0xff50B441),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static LinearGradient darkGreenWithOpacityGradient = LinearGradient(
    colors: [
      const Color(0xff252E12).withOpacity(0.5),
      const Color(0xff258A66).withOpacity(0.5),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const LinearGradient darkGreenToExtraDarkGreenGradient = LinearGradient(
    colors: [
      Color(0xff252E12),
      Color(0xff258A66),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );

  static const LinearGradient lightGreenToBlueGradient = LinearGradient(
    colors: [
      Color(0xff22944F),
      Color(0xff196C6C),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient lightGreenToYellowGradient = LinearGradient(
    colors: [
      Color(0xffFFE600),
      Color(0xff00FFC2),
    ],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  );

  static const LinearGradient orangeToRedGradient = LinearGradient(
    colors: [
      Color(0xff570000),
      Color(0xffFF0000),
      Color(0xffFF0B00),
      Color(0xffFFC700),
    ],
    begin: Alignment.bottomCenter,
    end: Alignment.topCenter,
  );
}
