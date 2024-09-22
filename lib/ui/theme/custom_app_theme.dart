import 'package:flutter/material.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/theme/ui_fonts.dart';

class CustomAppTheme {
  static ColorScheme get searchSchema {
    return ColorScheme.light(
      primary: AppColors.white,
      secondary: AppColors.black,
    );
  }

  static ThemeData defaultTheme = ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primary,
    fontFamily: AppFonts.semiBold,
    textTheme: TextTheme(
      titleMedium: TextStyle(
        fontSize: 16.0,
        fontFamily: AppFonts.regular,
        color: Colors.white,
      ),
    ),
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: AppColors.primary,
      accentColor: AppColors.accent,
      backgroundColor: Colors.white,
    ),
    scaffoldBackgroundColor: Colors.white,
    cardTheme: const CardTheme(
      color: Colors.white,
    ),
  );
}
