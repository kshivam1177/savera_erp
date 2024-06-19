import 'package:flutter/material.dart';
import 'package:savera_erp/ui/utils/app_theme.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';
import 'package:savera_erp/ui/utils/size_reziser.dart';

import 'dx_text.dart';

class DxCancelButton extends StatelessWidget {
  final VoidCallback onClicked;
  final String buttonText;
  final Color buttonBgColor;

  const DxCancelButton({
    super.key,
    required this.onClicked,
    required this.buttonText,
    this.buttonBgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        minimumSize: const Size(48.0, 48.0),
        backgroundColor: primaryRed,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.red,
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      onPressed: onClicked,
      child: Text(
        buttonText,
        style: AppStyles.getTextStyleColor(
          false,
          getSize(18, context),
          fontWeight: FontWeight.bold,
          textColor: Colors.white,
        ),
      ),
    );
  }
}

class DxFlatButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color bgColor;
  final Color textColor;
  final double textSize;
  final EdgeInsetsGeometry? padding;
  final Color borderColor;

  const DxFlatButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderColor = Colors.black,
    this.padding,
    this.bgColor = Colors.white,
    this.textColor = Colors.white,
    required this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension * 0.9,
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: padding,
          textStyle: TextStyle(
            fontSize: getSize(textSize, context),
          ),
          backgroundColor: bgColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: borderColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.getTextStyleColor(
            false,
            getSize(18, context),
            fontWeight: FontWeight.bold,
            textColor: textColor,
          ),
        ),
      ),
    );
  }
}

class DxFlatButtonAccent extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double round;
  final double fontSize;
  final FontWeight weight;
  final double? height;
  final double? width;

  const DxFlatButtonAccent({
    super.key,
    required this.onPressed,
    required this.text,
    this.round = 5,
    this.fontSize = 18,
    this.weight = FontWeight.bold,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? kMinInteractiveDimension * 0.9,
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).colorScheme.secondary,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: Colors.green.shade500,
              width: 2,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(round),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.getTextStyleColor(
            false,
            getSize(fontSize, context),
            fontWeight: weight,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DxFlatButtonPrimary extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const DxFlatButtonPrimary({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension * 0.9,
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: primaryColor,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.getTextStyleColor(
            false,
            getSize(18, context),
            fontWeight: FontWeight.bold,
            textColor: Colors.white,
          ),
        ),
      ),
    );
  }
}

class DxFlatButtonWhite extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const DxFlatButtonWhite(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension * 0.9,
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.black,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.getTextStyleColor(
            false,
            getSize(18, context),
            fontWeight: FontWeight.bold,
            textColor: Colors.black87,
          ),
        ),
      ),
    );
  }
}

class DxFlatButtonRed extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const DxFlatButtonRed(
      {super.key, required this.onPressed, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kMinInteractiveDimension * 0.9,
      padding: const EdgeInsets.all(2.0),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              color: Colors.red,
              width: 1,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: AppStyles.getTextStyleColor(
            false,
            getSize(18, context),
            fontWeight: FontWeight.bold,
            textColor: Colors.red,
          ),
        ),
      ),
    );
  }
}

/*
* Custom Buttons to be used inside the whole app as wrapper to native ones
* if needed modify here, or replicate it here only.
* */

//--------------------- Text Button --------------------------
class DxOutlineButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  // final Color color;
  final Color textColor;
  final Size? size;

  const DxOutlineButton(
    this.text, {
    super.key,
    this.textColor = Colors.white,
    // this.color,
    required this.onPressed,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: size,
        side: BorderSide(
          color: textColor,
          width: 1,
          style: BorderStyle.solid,
        ),
        padding: const EdgeInsets.all(10),
      ),
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      // style: ButtonStyle(
      //   // backgroundColor: MaterialStateProperty.all(textColor),
      //   shape: MaterialStateProperty.all(
      //     RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(4.0),
      //       side: BorderSide(
      //         width: 2,
      //         color: textColor,
      //         style: BorderStyle.solid,
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}

//--------------------- Text Icon button --------------------------
class DxTextButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  final Widget icon;

  const DxTextButtonIcon({
    super.key,
    required this.icon,
    required this.onPressed,
    required this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(btnTitle),
      icon: icon,
    );
  }
}

//--------------------- Text Icon button --------------------------
class DxTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final bool bold;
  final Color textColor;

  const DxTextButton(
    this.text, {
    required this.onPressed,
    this.bold = false,
    this.textColor = Colors.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: DxText(
        text,
        bold: bold,
        textColor: textColor,
      ),
    );
  }
}

//--------------------- Text Icon button --------------------------
class DxOutlineButtonIcon extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  final Widget icon;
  final Color borderColor;
  final Color textColor;
  final double fontSize;

  const DxOutlineButtonIcon({
    super.key,
    this.textColor = Colors.white,
    this.borderColor = Colors.black,
    this.fontSize = 16,
    required this.icon,
    required this.onPressed,
    required this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      style: OutlinedButton.styleFrom(
        side: BorderSide(color: borderColor),
        padding: EdgeInsets.zero,
      ),
      onPressed: onPressed,
      label: DxText(
        btnTitle,
        textColor: textColor,
        fontSize: fontSize,
      ),
      icon: icon,
    );
  }
}

class DxElevatedButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const DxElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, child: Text(text));
  }
}

class DxOutlinedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnTitle;
  final Color bgColor;

  const DxOutlinedButton({
    super.key,
    required this.onPressed,
    required this.btnTitle,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.teal,
        backgroundColor: Colors.grey.shade50,
      ),
      child: DxText(btnTitle),
    );
  }
}
