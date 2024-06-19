import 'dart:math';
import 'package:flutter/material.dart';

//
// ThemeData get defaultAppThemeData => ThemeData(
//       fontFamily: AppFonts.textRegular,
//       primarySwatch: materialPrimaryColor,
//       hintColor: materialAccentColor,
//       colorScheme: ColorScheme.light(secondary: materialAccentColor),
//       scaffoldBackgroundColor: Colors.white,
//       appBarTheme: AppBarTheme()
//           .copyWith(systemOverlayStyle: SystemUiOverlayStyle.light),
//       platform: TargetPlatform.android,
//       iconTheme: IconThemeData(color: Colors.white),
//       primaryIconTheme: IconThemeData(color: Colors.white),
//     );

const MaterialColor materialPrimaryColor = MaterialColor(
  0xff434242,
  <int, Color>{
    50: Color(0xff434242),
    100: Color(0xff434242),
    200: Color(0xff434242),
    300: Color(0xff434242),
    400: Color(0xff434242),
    500: Color(0xff434242),
    600: Color(0xff434242),
    700: Color(0xff434242),
    800: Color(0xff434242),
    900: Color(0xff434242),
  },
);
const MaterialColor materialAccentColor = MaterialColor(
  0xff02B056,
  <int, Color>{
    50: Color(0xff02B056),
    100: Color(0xff02B056),
    200: Color(0xff02B056),
    300: Color(0xff02B056),
    400: Color(0xff02B056),
    500: Color(0xff02B056),
    600: Color(0xff02B056),
    700: Color(0xff02B056),
    800: Color(0xff02B056),
    900: Color(0xff02B056),
  },
);

/*
* New colors added to make ui more clean
* */

const textColorPrimary = Color(0xFF444444);

Color get themeGreen => const Color(0xff02B056);

const cboGrey = Color(0xFFF2F2F2);
const widgetViewColor = Color(0xFFEEEEF1);
const layoutBackground = Color(0xFFF6F7FA);
const dbShadowColor = Color(0x95E9EBF0);
const appIconTintSkyBlue = Color(0xFF73d8d4);
const appIconTintMustardYellow = Color(0xFFffc980);
const appDarkRed = Color(0xFFF06263);
const appLightRed = Color(0xFFF89B9D);
const bluePurple = Color(0xFF8998FE);
const catOrange = Color(0xFFFF9781);
const greenBlue = Color(0xFF73D7D3);
const skyBlue = Color(0xFF87CEFA);

Color get primaryColor => materialPrimaryColor;

Color get primaryRed => Colors.red;

Color get primaryRed20 => Colors.red.shade200;

Color get primaryRed40 => Colors.red.shade400;

Color get primaryRed60 => Colors.red.shade600;

//from old app
// Color get materialAccentColor => Color(0xff267b1b);

Color get textBlueDark => const Color(0xff3051A0);

Color get categoryIconCyan => const Color(0xff1bbef9);

Color get categoryTitleGrayDark => const Color(0xff707070);

Color get categoryCardBg => const Color(0xffe6ecf2);

Color get lightDividerColor => Colors.grey.shade200;

Color get borderSideColor => Colors.black26;

Color get borderSideFocusedColor => primaryColor;

Color get lightGrey50 => Colors.grey.shade50;

Color get whiteColor => Colors.white;

MaterialColor get randomColor =>
    Colors.primaries[Random().nextInt(Colors.primaries.length)];

abstract class AppFonts {
  static String get textRegular => 'MontserratRegular';

  static String get textBold => 'MontserratBold';

  static String get textSemiBold => 'MontserratSemiBold';
}

class RandomColorHelper {
  static final Map<String, MaterialColor> _colorMap = {
    'A': Colors.red,
    'B': Colors.blue,
    'C': Colors.green,
    'D': Colors.yellow,
    'E': Colors.orange,
    'F': Colors.purple,
    'G': Colors.indigo,
    'H': Colors.teal,
    'I': Colors.cyan,
    'J': Colors.brown,
    'K': Colors.amber,
    'L': Colors.pink,
    'M': Colors.lime,
    'N': Colors.lightBlue,
    'O': Colors.deepOrange,
    'P': Colors.deepPurple,
    'Q': Colors.blueGrey,
    'R': Colors.red,
    'S': Colors.green,
    'T': Colors.amber,
    'U': Colors.blue,
    'V': Colors.purple,
    'W': Colors.teal,
    'X': Colors.lightGreen,
    'Y': Colors.lime,
    'Z': Colors.orange,
    // Add more character-color mappings as needed
  };
  static MaterialColor getRandomColor(String productName) {
    // Get the first character of the product name
    String firstChar = productName.isNotEmpty ? productName[0].toUpperCase() : 'A';

    // Check if the character is in the map, if not, use a fallback color
    return _colorMap[firstChar]!;
  }
}
