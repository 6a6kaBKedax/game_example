import 'package:flutter/material.dart';
import 'package:game_example/consts/style/app_shadows.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFonts {
  static final TextStyle juraW400Size58White = GoogleFonts.jura(
    fontWeight: FontWeight.w400,
    fontSize: 58.0,
    color: Colors.white,
  );

  static final TextStyle juraW400Size40White = GoogleFonts.jura(
    fontWeight: FontWeight.w400,
    fontSize: 40.0,
    color: Colors.white,
  );

  static final TextStyle juraW400Size36White = GoogleFonts.jura(
    fontWeight: FontWeight.w400,
    fontSize: 36.0,
    shadows: AppShadows.mediumShadow,
    color: Colors.white,
  );

  static final TextStyle juraW400Size36Green = GoogleFonts.jura(
    fontWeight: FontWeight.w400,
    fontSize: 36.0,
    shadows: AppShadows.mediumShadowBlue,
    color: const Color(0xFF00FF38),
  );

  static final TextStyle juraW400Size64Green = GoogleFonts.jura(
    fontWeight: FontWeight.w400,
    fontSize: 64.0,
    shadows: AppShadows.mediumShadowBlue,
    color: Colors.white,
  );
}
