import 'package:flutter/material.dart';
import 'package:savera_erp/app_utilities/app_constants.dart';
import 'package:savera_erp/ui/utils/app_theme.dart';

class CustomAppTheme {
  static ThemeData get defaultTheme {
    return ThemeData(
      useMaterial3: false,
      primaryColor: Colors.grey.shade800,
      fontFamily: AppConstants.textSemiBold,
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 16.0,
          fontFamily: AppConstants.textRegular,
          color: Colors.white,
        ),
      ),
      colorScheme: ColorScheme.fromSwatch(
        primarySwatch: materialPrimaryColor,
        accentColor: materialAccentColor,
        backgroundColor: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      cardTheme: const CardTheme(
        color: Colors.white,
      ),
    );
  }

}