import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies/src/core/theme/app_colors.dart';

abstract class AppTheme {
  static final TextStyle _genericTextTheme =
      GoogleFonts.manrope().copyWith(color: Colors.white);

  static ThemeData appTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: _genericTextTheme,
        bodyText2: _genericTextTheme,
      ),
      appBarTheme: AppBarTheme(
          color: AppColors.mainColor, toolbarTextStyle: _genericTextTheme));
}
