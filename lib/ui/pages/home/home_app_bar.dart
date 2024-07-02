import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/app_utilities/app_images.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/ui/widgets/custom/dx_logo.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';
import 'package:savera_erp/ui/widgets/dailog/logout_dailog.dart';
import 'package:savera_erp/ui/widgets/dx_layout_builder.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 1,
      automaticallyImplyLeading: false,
      centerTitle: false,
      backgroundColor: Colors.white,
      title: DxLogo(),
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
        DxLayoutBuilder(
          buildMobileView: (c) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DxText(DxLayoutType.mobile.toString()),
              ),
            );
          },
          buildTabView: (c) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DxText(DxLayoutType.tab.toString()),
              ),
            );
          },
          buildSmallTabView: (c) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DxText(DxLayoutType.smallTab.toString()),
              ),
            );
          },
          buildDesktopView: (c) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: DxText(DxLayoutType.desktop.toString()),
              ),
            );
          },
        ),
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
