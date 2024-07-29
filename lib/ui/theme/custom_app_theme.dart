import 'package:flutter/material.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/theme/ui_fonts.dart';

class CustomAppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      useMaterial3: false,
      primaryColor: Colors.grey.shade800,
      fontFamily: AppFonts.textSemiBold,
      textTheme: TextTheme(
        titleMedium: TextStyle(
          fontSize: 16.0,
          fontFamily: AppFonts.textRegular,
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
}
