import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/app_utilities/app_images.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/ui/widgets/dailog/logout_dailog.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: Image.asset(AppImages.icLogoURL, height: 22),
      // Replace with your image asset path
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          );
        },
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            Helpers.toast(context, msg: "Notification Clicked");
          },
          icon: const Icon(
            CupertinoIcons.bell,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            Helpers.toast(context, msg: "Setting Clicked");
          },
          icon: const Icon(
            Icons.settings,
            color: Colors.black,
          ),
        ),
        SizedBox(width: 10),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return const LogoutDialog();
              },
            );
          },
          icon: Icon(
            Icons.power_settings_new,
            color: Colors.redAccent,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
