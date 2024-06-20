import 'package:flutter/material.dart';

class TextRegular extends Text {
  final MaterialColor? textColor;
  final double? textSize;

  const TextRegular(
    super.data, {
    super.key,
    this.textColor,
    this.textSize,
    super.style,
    super.textAlign,
    super.textDirection,
    super.softWrap,
    super.overflow,
    super.textScaler,
    super.maxLines,
  });
}
