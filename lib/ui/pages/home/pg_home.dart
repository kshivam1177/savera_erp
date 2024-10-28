import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/home/home_cubit.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/shared/helpers.dart';
import 'package:savera_erp/ui/pages/home/dashboard_summary/dashboard_summary.dart';
import 'package:savera_erp/ui/pages/home/drawer/DxDrawer.dart';
import 'package:savera_erp/ui/pages/home/home_app_bar.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:toastification/toastification.dart';

class PgHome extends StatefulWidget {
  static const String routeName = '/home';

  const PgHome({super.key});

  @override
  State<PgHome> createState() => PgHomeState();
}

class PgHomeState extends State<PgHome> {
  List<ItemData> menus = [];
  // bool checkingForLogin = true;

  @override
  void initState() {
    menus = HomeCubit().getMenus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if (checkingForLogin) {
    //   return Scaffold(
    //     body: Center(
    //       child: CircularProgressIndicator(
    //         color: AppColors.primary,
    //       ),
    //     ),
    //   );
    // }
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: HomeAppBar(),
      body: DashboardSummary(),
      drawer: DxDrawer(
        menus: menus,
        onItemTapped: (groupId, item) {
          try {
            RouteHelper.pop(context);
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
