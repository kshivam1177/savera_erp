import 'package:flutter/material.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';

import '../theme/ui_fonts.dart';

InputDecoration dxTextFieldDecoration(
  BuildContext context, {
  EdgeInsetsGeometry? roundPadding,
  required String hint,
  Widget? prefixIcon,
  Widget? suffixIcon,
  double textSize = 16,
  Color fillColor = Colors.white,
  bool? isFilled = false,
  bool displayBorder = true,
  double radius = 0.0,
  double borderWidth = 1.2,
  Color? borderColor,
  Color? focusColor,
  double? hintTextSize,
  bool showDefaultPrefixIcon = false,
  bool showLabel = true,
  String? errorText,
}) {
  borderColor ??= AppColors.black.shade100;
  focusColor ??= AppColors.primary;
  // final _defaultBorderWidth = 1.2;
  const focusedBorderWidth = 1.7;
  // borderColor = Colors.green;
  // focusColor = Colors.red;
  //Color errorBorder = Colors.red;

  //borderColor = Colors.red;
  //borderColor = (errorText != null && errorText.isNotEmpty ? Colors.red : borderColor);
  return InputDecoration(
    prefixIcon: prefixIcon != null || showDefaultPrefixIcon
        ? SizedBox(
            width: 48,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                prefixIcon ?? const Icon(Icons.edit),
                Container(
                  height: 35,
                  width: 1,
                  color: Colors.grey.shade300,
                )
              ],
            ),
          )
        : null,
    suffixIcon: suffixIcon,
    alignLabelWithHint: true,
    filled: isFilled,
    fillColor: fillColor,
    contentPadding: roundPadding ??
        const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 15.0,
        ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(radius),
      borderSide: BorderSide(
        color: Colors.red,
        width: borderWidth,
      ),
    ),
    enabledBorder: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          )
        : InputBorder.none,
    disabledBorder: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          )
        : InputBorder.none,
    border: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: borderColor,
              width: borderWidth,
            ),
          )
        : InputBorder.none,
    focusedBorder: displayBorder
        ? OutlineInputBorder(
            borderRadius: BorderRadius.circular(radius),
            borderSide: BorderSide(
              color: focusColor,
              width: focusedBorderWidth,
            ),
          )
        : InputBorder.none,
    labelText: showLabel ? hint : null,
    errorText: errorText,
    errorStyle: TextStyle(
      color: Colors.red.shade700,
      fontSize: 10,
      fontWeight: FontWeight.normal,
    ),
    hintText: showLabel ? null : hint,
    hintStyle: TextStyle(fontSize: hintTextSize ?? 16),
    labelStyle: TextStyle(
      color: Colors.grey.shade700,
      fontSize: textSize,
      //fontSize: getSize(textSize, context),
      // fontFamily: AppFonts.textRegular,
      fontWeight: FontWeight.normal,
    ),
  );
}

class AppStyles {
  AppStyles._();

  static TextStyle getTextStyle(
    bool isSemiBold,
    double fontSize, {
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
  }) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w600 : fontWeight,
        color: color,
        fontSize: fontSize,
        fontFamily: isSemiBold ? AppFonts.textSemiBold : AppFonts.textRegular,
      );

  static TextStyle getTextStrikeThrough(
    bool isSemiBold,
    double fontSize, {
    Color textColor = Colors.black,
  }) =>
      TextStyle(
        // fontFamily: isSemiBold ? AppFonts.textSemiBold : AppFonts.textRegular,
        color: textColor,
        fontWeight: isSemiBold ? FontWeight.w600 : FontWeight.normal,
        fontSize: fontSize,
        decoration: TextDecoration.lineThrough,
      );

  static TextStyle getTextStyleColor(
    bool isSemiBold,
    double fontSize, {
    Color textColor = Colors.black,
    FontWeight fontWeight = FontWeight.w500,
  }) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : fontWeight,
        color: textColor,
        fontSize: fontSize,
      );

  static TextStyle getTextStylePrimary(bool isSemiBold, double fontSize) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        color: AppColors.primary,
        fontSize: fontSize,
      );

  static TextStyle getTextStyleGreen(bool isSemiBold, double fontSize) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        color: AppColors.accent,
        fontSize: fontSize,
      );

  static TextStyle getTextStyleRed(bool isSemiBold, double fontSize) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        color: Colors.redAccent,
        fontSize: fontSize,
      );

  static TextStyle getTextStyleWhite(
    bool isSemiBold,
    double fontSize, {
    FontWeight? weight,
  }) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: weight ?? (isSemiBold ? FontWeight.w800 : FontWeight.w500),
        color: Colors.white,
        fontSize: fontSize,
      );

  static TextStyle getTextStyleDefaultColor(bool isSemiBold, double fontSize) =>
      TextStyle(
        // fontFamily: AppFonts.textRegular,
        fontWeight: isSemiBold ? FontWeight.w800 : FontWeight.w500,
        fontSize: fontSize,
      );
}

//--------------------- Experimental --------------------------
const foodShadowColor = Color(0X95E9EBF0);
const foodColorGray = Color(0xFFFAFAFA);
const foodShadowColors = Color(0XFFE2E2E2);

BoxDecoration gradientBoxDecoration({
  double radius = 8.0,
  Color color = Colors.transparent,
  Color gradientColor2 = Colors.white,
  Color gradientColor1 = Colors.white,
  var showShadow = false,
}) {
  return BoxDecoration(
    gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [gradientColor1, gradientColor2]),
    boxShadow: showShadow
        ? [
            const BoxShadow(
                color: foodShadowColor, blurRadius: 10, spreadRadius: 2)
          ]
        : [const BoxShadow(color: Colors.transparent)],
    border: Border.all(color: color),
    borderRadius: BorderRadius.all(Radius.circular(radius)),
  );
}

var shadowColorGlobal = Colors.black12;

class AppDecoration {
  BoxDecoration boxDecoration({
    double radius = 2,
    Color color = Colors.transparent,
    Color bgColor = Colors.white,
    var showShadow = false,
  }) {
    return BoxDecoration(
      color: bgColor,
      boxShadow: showShadow
          ? [
              BoxShadow(
                color: shadowColorGlobal,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]
          : [const BoxShadow(color: Colors.transparent)],
      border: Border.all(color: color),
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }

  static getInputDecoration(String labelHint) => InputDecoration(
        labelText: labelHint,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        border: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.4),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(width: 1.6),
        ),
      );

  static getInputDecorationNoLine(String labelHint) => InputDecoration(
        labelText: labelHint,
        alignLabelWithHint: true,
        contentPadding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 10.0),
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      );

  static getOutLineBoxDecoration([
    Color color = Colors.black,
  ]) =>
      BoxDecoration(
        border: Border.all(color: color),
      );

  static getBoxGradientDecoration() => BoxDecoration(
        // Box decoration takes a gradient
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.green.shade50, Colors.white],
        ),
      );

  static getBoxRoundDecoration({Color bColor = Colors.black45}) =>
      BoxDecoration(
        border: Border.all(width: 1, color: bColor),
        borderRadius: BorderRadius.circular(4),
        color: Colors.white,
      );

  static getRoundRectangleDecoration() => RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      );

  static getRoundRectangleDecorationColor({Color borderColor = Colors.black}) =>
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(color: borderColor),
      );

  static getInputDecorationPlain(String labelHint) => InputDecoration(
        labelText: labelHint,
        filled: true,
        fillColor: Colors.white,
        focusColor: Colors.white,
        hoverColor: Colors.white,
        contentPadding: const EdgeInsets.fromLTRB(6.0, 6.0, 6.0, 6.0),
      );
}
