import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class DxTextWithHeading extends StatelessWidget {
  final String label;
  final String text;
  final double? labelSize;
  final double? textSize;

  const DxTextWithHeading({
    super.key,
    required this.label,
    required this.text,
    this.labelSize,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: DxTextBlack(
            label,
            bold: true,
            fontSize: labelSize ?? 14,
          ),
          flex: 3,
        ),
        SizedBox(
          child: DxTextBlack(
            "-",
            fontSize: labelSize ?? 14,
            bold: true,
          ),
          width: 12,
        ),
        Expanded(
          child: DxTextBlack(
            text,
            fontSize: textSize ?? 14,
          ),
          flex: 7,
        ),
      ],
    );
  }
}
