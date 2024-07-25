import 'package:flutter/material.dart';

const double defaultBorderRadius = 5;
const double defaultButtonHeight = 45;

class DxFabExtended extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final Color? borderColor;
  final Widget? prefix;
  final double? elevation;
  final double? radius;

  const DxFabExtended({
    required this.text,
    this.prefix,
    this.onPressed,
    this.backgroundColor,
    this.textStyle,
    this.borderColor,
    this.elevation,
    this.radius,
    super.key,
  });

  factory DxFabExtended.add({
    required String text,
    VoidCallback? onPressed,
    Color? color,
    Color? borderColor,
    double? elevation,
    TextStyle? textStyle,
    Key? key,
  }) {
    return DxFabExtended(
      text: text,
      onPressed: onPressed,
      backgroundColor: color,
      textStyle: textStyle,
      borderColor: borderColor,
      elevation: elevation,
      prefix: const Icon(
        Icons.add,
        color: Colors.white,
      ),
      key: key,
    );
  }

  factory DxFabExtended.icon({
    required String text,
    VoidCallback? onPressed,
    Color? color,
    Color? borderColor,
    double? elevation,
    TextStyle? textStyle,
    Key? key,
    Widget? icon,
    double? radius,
  }) {
    return DxFabExtended(
      text: text,
      onPressed: onPressed,
      backgroundColor: color,
      textStyle: textStyle,
      borderColor: borderColor,
      elevation: elevation,
      prefix: icon,
      radius: radius,
      key: key,
    );
  }

  factory DxFabExtended.loader({
    required String text,
    Color? color,
    Color? borderColor,
    double? elevation,
    TextStyle? textStyle,
    Key? key,
    bool showLoader = true,
    VoidCallback? onPressed,
  }) {
    return DxFabExtended(
      text: text,
      backgroundColor: color,
      textStyle: textStyle,
      borderColor: borderColor,
      elevation: elevation,
      onPressed: onPressed,
      prefix: showLoader
          ? const SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 2.5,
                color: Colors.white,
              ),
            )
          : null,
      key: key,
    );
  }

  // add suffix support here on sample screen
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      height: defaultButtonHeight,
      child: FloatingActionButton.extended(
        backgroundColor: backgroundColor,
        onPressed: onPressed,
        elevation: elevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(radius ?? defaultBorderRadius),
          ),
          side: BorderSide(
            color: borderColor ?? Colors.transparent,
          ),
        ),
        label: prefix != null
            ? Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  prefix!,
                  const SizedBox(width: 8),
                  Text(text, style: textStyle)
                ],
              )
            : Text(text, style: textStyle),
      ),
    );
  }
}
