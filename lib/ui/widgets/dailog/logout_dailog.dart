import 'package:flutter/material.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/services/storage/preference/preference_handler.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const DxTextBlack(
        "Logout Confirmation !",
        bold: true,
        fontSize: 18,
      ),
      content: const DxTextBlack(
        "Are you sure you want to log out?",
        bold: false,
        fontSize: 16,
        maxLine: 4,
      ),
      actions: <Widget>[
        TextButton(
          child: const DxText(
            "Cancel",
            fontSize: 18,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        // usually buttons at the bottom of the dialog
        TextButton(
          child: const DxTextGreen(
            "Logout",
            fontSize: 18,
          ),
          onPressed: () async {
            await PrefHandler.clearPref();
            // await PrefHandler.setUserPic(AppImages.defaultUserBs64);
            // Navigator.of(context).pop();
            RouteHelper.toLoginPage(context);
          },
        ),
      ],
    );
  }
}
