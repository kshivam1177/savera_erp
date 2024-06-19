import 'package:flutter/material.dart';
import 'package:savera_erp/ui/custom_widgets/dx_text.dart';

import '../utils/dx_app_decoration.dart';

class DisplayMessageDialog extends StatelessWidget {
  final String title;
  final String? body;
  final String buttonText;
  final VoidCallback onPressed;

  const DisplayMessageDialog({super.key,
    required this.title,
    this.body,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: DxTextBlack(
        title,
        maxLine: 4,
        fontSize: 18,
        bold: (body != null),
      ),
      content: body == null
          ? null
          : DxTextBlack(
            body!,
            maxLine: 6,
            fontSize: 18,
          ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: AppStyles.getTextStyle(true, 16),
          ),
        )
      ],
    );
  }
}

class PurchaseCompleteDialog extends StatelessWidget {
  final String msg, title;
  final Function() onOrderDetailClick;
  final Function() onCancelClick;

  const PurchaseCompleteDialog({super.key,
    required this.msg,
    required this.title,
    required this.onOrderDetailClick,
    required this.onCancelClick,
  });

  @override
  Widget build(BuildContext context) {
    //Size screenSize = MediaQuery.of(context).size;
    return AlertDialog(
      title: DxText(
        title,
        fontSize: 20,
        bold: true,
      ),
      content: DxText(
        msg,
        fontSize: 18,
        maxLines: 10,
      ),
      actions: [
        OutlinedButton(
          onPressed: onOrderDetailClick,
          style: ButtonStyle(
            side: WidgetStateProperty.all(
              const BorderSide(color: Colors.green),
            ),
          ),
          child: const DxTextGreen(
            'Order Detail',
            bold: true,
          ),
        ),
        OutlinedButton(
          onPressed: () {
            onCancelClick();
          },
          // color: Colors.white,
          child: Text('Go Back',
              style: AppStyles.getTextStyleColor(
                true,
                14,
                textColor: Colors.black54,
              )),
        ),
      ],
    );
  }
}