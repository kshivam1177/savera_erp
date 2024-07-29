import 'dart:math';

import 'package:flutter/material.dart';

mixin AppColors {
  static const MaterialColor green = primary;
  static const Color white = Colors.white;
  static const Color green02 = Color(0xfffafdfc);
  static const Color red02 = Color(0xfffdf7f7);
  static const Color black02 = Color(0xFFF3F3F3);
  static const Color gray = Color(0xFF8A8A8A);
  static const Color yellow = Colors.yellow;
  static const Color orange = Colors.orange;
  static const Color pink = Colors.pink;
  static const Color skyBlue = Colors.lightBlueAccent;
  static const Color blackShade50Transparent = Color(0x80000000);

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

  static const MaterialColor primary = MaterialColor(
    0xff0bab5a,
    <int, Color>{
      50: Color(0xfff8fdfb),
      100: Color(0xffeafaf1),
      200: Color(0xffd7fce8),
      300: Color(0xffcfffe6),
      400: Color(0xffb0f8d3),
      500: Color(0xff82e3b0),
      600: Color(0xff6ef8b0),
      700: Color(0xff4ad28b),
      800: Color(0xff1dc46f),
      900: Color(0xff0bab5a),
    },
  );
  static const MaterialColor accent = MaterialColor(
    0xff434242,
    <int, Color>{
      50: Color(0xfff8f8f8),
      100: Color(0xffe1e1e1),
      200: Color(0xffd9d9d9),
      300: Color(0xffc2c1c1),
      400: Color(0xffababab),
      500: Color(0xffa2a2a2),
      600: Color(0xff888787),
      700: Color(0xff6b6969),
      800: Color(0xff6e6d6d),
      900: Color(0xff484848),
    },
  );

  static const MaterialColor navyBlue = MaterialColor(0xff3051A0, <int, Color>{
    50: Color(0xffdfe7fa),
    100: Color(0xffaabdee),
    200: Color(0xff8ba4e1),
    300: Color(0xff748ece),
    400: Color(0xff607fc9),
    500: Color(0xff4766b4),
    600: Color(0xff3354a2),
    700: Color(0xff20459d),
    800: Color(0xff14368a),
    900: Color(0xff062b86),
  });

  static const MaterialColor black = MaterialColor(0xFF000000, <int, Color>{
    50: Color(0xFFE0E0E0),
    100: Color(0xFFBDBDBD),
    200: Color(0xFF9E9E9E),
    300: Color(0xFF7E7E7E),
    400: Color(0xFF616161),
    500: Color(0xFF424242),
    600: Color(0xFF303030),
    700: Color(0xFF212121),
    800: Color(0xFF181818),
    900: Color(0xFF000000),
  });

  static const MaterialColor red = MaterialColor(0xFFf44336, <int, Color>{
    50: Color(0xFFffebee),
    100: Color(0xFFffcdd2),
    200: Color(0xFFef9a9a),
    300: Color(0xFFe57373),
    400: Color(0xFFef5350),
    500: Color(0xFFf44336),
    600: Color(0xFFe53935),
    700: Color(0xFFd32f2f),
    800: Color(0xFFc62828),
    900: Color(0xFFb71c1c),
  });

  static Color fromHex(String hexColor) {
    final hexCode = hexColor.replaceAll('#', '');
    return Color(int.parse('FF$hexCode', radix: 16));
  }

  static MaterialColor get randomColor {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static MaterialColor getRandomColor(String text) {
    // Get the first character of the product name
    String firstChar = text.isNotEmpty ? text[0].toUpperCase() : 'A';

    // Check if the character is in the map, if not, use a fallback color
    return _colorMap[firstChar]!;
  }
}
