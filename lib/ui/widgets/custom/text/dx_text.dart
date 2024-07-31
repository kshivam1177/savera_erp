import 'package:flutter/material.dart';
import 'package:savera_erp/shared/responsive.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

class DxTextWhite extends StatelessWidget {
  final String text;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight? weight;

  const DxTextWhite(
    this.text, {
    super.key,
    this.fontSize = 14,
    this.textAlign,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.getTextStyleWhite(
        false,
        Responsive.getSize(fontSize, context),
        weight: weight,
      ),
      textAlign: textAlign,
    );
  }
}

class DxTextBlack extends StatelessWidget {
  final String mTitle;
  final bool bold;
  final double fontSize;
  final TextAlign? textAlign;
  final FontWeight fontWeight;
  final TextOverflow overflow;
  final int? maxLine;

  const DxTextBlack(
    this.mTitle, {
    super.key,
    this.textAlign,
    this.maxLine = 1,
    this.overflow = TextOverflow.ellipsis,
    this.bold = false,
    this.fontSize = 14,
    this.fontWeight = FontWeight.w600,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      mTitle,
      overflow: overflow,
      maxLines: maxLine,
      style: bold
          ? AppStyles.getTextStyle(
              bold,
              Responsive.getSize(fontSize, context),
              fontWeight: fontWeight,
            )
          : AppStyles.getTextStyle(bold, Responsive.getSize(fontSize, context)),
      textAlign: textAlign,
    );
  }
}

class DxText extends StatelessWidget {
  final String text;
  final bool bold;
  final double fontSize;
  final Color textColor;
  final TextAlign? textAlign;
  final int maxLines;
  final TextOverflow overflow;
  final bool lineThrough;

  const DxText(
    this.text, {
    super.key,
    this.bold = false,
    this.maxLines = 1,
    this.textAlign,
    this.fontSize = 14,
    this.lineThrough = false,
    this.overflow = TextOverflow.ellipsis,
    this.textColor = Colors.black,
  });

  @override
  Widget build(BuildContext context) {
    return lineThrough
        ? Text(
            text,
            style: AppStyles.getTextStrikeThrough(
              bold,
              Responsive.getSize(fontSize, context),
              textColor: textColor,
            ),
            overflow: overflow,
            textAlign: textAlign,
            maxLines: maxLines,
          )
        : Text(
            text,
            style: AppStyles.getTextStyle(
              bold,
              Responsive.getSize(fontSize, context),
              color: textColor,
            ),
            overflow: overflow,
            textAlign: textAlign,
            maxLines: maxLines,
          );
  }
}

class DxTextRed extends StatelessWidget {
  final String text;
  final bool bold;
  final double size;
  final TextAlign? textAlign;

  const DxTextRed(
    this.text, {
    super.key,
    this.bold = false,
    this.size = 14,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppStyles.getTextStyleRed(
        bold,
        Responsive.getSize(size, context),
      ),
    );
  }
}

class DxTextGreen extends StatelessWidget {
  final String text;
  final bool bold;
  final double fontSize;
  final TextAlign? textAlign;

  const DxTextGreen(
    this.text, {
    super.key,
    this.bold = false,
    this.fontSize = 14,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: AppStyles.getTextStyleGreen(
        bold,
        Responsive.getSize(fontSize, context),
      ),
    );
  }
}

class DxTextPrimary extends StatelessWidget {
  final String text;
  final bool bold;
  final double size;
  final TextAlign textAlign;

  const DxTextPrimary(
    this.text, {
    super.key,
    this.bold = false,
    this.size = 14,
    this.textAlign = TextAlign.left,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppStyles.getTextStylePrimary(
        bold,
        Responsive.getSize(size, context),
      ),
      textAlign: textAlign,
    );
  }
}

class DxReachPrimary extends StatelessWidget {
  final String text;
  final String subText;
  final double textSize;
  final double subTextSize;
  final TextAlign textAlign;
  final bool boldText;
  final bool boldSubText;

  const DxReachPrimary(
    this.text, {
    super.key,
    this.textSize = 14,
    this.subTextSize = 12,
    this.textAlign = TextAlign.left,
    this.subText = "",
    this.boldText = true,
    this.boldSubText = false,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      text: TextSpan(
        style: AppStyles.getTextStylePrimary(
          false,
          Responsive.getSize(textSize, context),
        ),
        children: <TextSpan>[
          TextSpan(
            text: text,
            style: TextStyle(
              fontSize: textSize,
              fontWeight: boldText ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          TextSpan(
            text: subText,
            style: TextStyle(
              fontSize: subTextSize,
              fontWeight: boldSubText ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
