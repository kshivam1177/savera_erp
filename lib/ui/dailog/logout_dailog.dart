import 'package:flutter/material.dart';
import 'package:savera_erp/local_storage/preference_handler.dart';
import 'package:savera_erp/ui/custom_widgets/dx_text.dart';
import 'package:savera_erp/ui/route/app_router.dart';

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
            AppRouter.toLoginPage(context);
          },
        ),
      ],
    );
  }
}
