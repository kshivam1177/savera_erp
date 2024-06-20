import 'package:flutter/material.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';


class DxBtnScanNow extends StatelessWidget {
  final VoidCallback onTap;

  const DxBtnScanNow({
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    // style: OutlinedButton.styleFrom(
    //   // minimumSize: Size(130, 40),
    //   // maximumSize: Size.fromHeight(30),
    //   side: BorderSide(
    //     color: Theme.of(context).colorScheme.secondary,
    //     width: 1,
    //     style: BorderStyle.solid,
    //   ),
    //   padding: EdgeInsets.all(10),
    // ),

    // style: ButtonStyle(
    //   // backgroundColor: MaterialStateProperty.all(
    //   //   Theme.of(context).colorScheme.secondary,
    //   // ),
    //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    //     RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(6.0),
    //       side: BorderSide(
    //         color: Colors.blue,
    //         width: 2,
    //         style: BorderStyle.solid,
    //       ),
    //     ),
    //   ),
    // ),

    return OutlinedButton.icon(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(
          Theme.of(context).colorScheme.secondary.withOpacity(0.07),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        side: WidgetStateProperty.all(
          BorderSide(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
      onPressed: onTap,
      icon: Icon(
        Icons.camera_alt,
        color: Theme.of(context).colorScheme.secondary,
      ),
      label: const DxTextGreen("Scan Now"),
    );
  }
}
