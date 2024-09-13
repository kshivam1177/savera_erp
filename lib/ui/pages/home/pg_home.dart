import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/home/home_cubit.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/shared/helpers.dart';
import 'package:savera_erp/ui/pages/home/dashboard_summary/dashboard_summary.dart';
import 'package:savera_erp/ui/pages/home/drawer/DxDrawer.dart';
import 'package:savera_erp/ui/pages/home/home_app_bar.dart';
import 'package:toastification/toastification.dart';

class PgHome extends StatefulWidget {
  static const String routeName = '/home';

  final String arg1;

  const PgHome({
    required this.arg1,
    super.key,
  });

  @override
  State<PgHome> createState() => PgHomeState();
}

class PgHomeState extends State<PgHome> {
  List<ItemData> menus = [];

  @override
  void initState() {
    menus = HomeCubit().getMenus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: HomeAppBar(),
      body: DashboardSummary(),
      drawer: DxDrawer(
        menus: menus,
        onItemTapped: (groupId, item) {
          try {
            Navigator.of(context).pop();
            RouteHelper.toAny(context, item.route);
          } catch (e) {
            print(e);
            Helpers.toast(
              context,
              msg: "Work in progress : ${item.title}",
              type: ToastificationType.info,
            );
          }
        },
      ),
    );
  }
}
