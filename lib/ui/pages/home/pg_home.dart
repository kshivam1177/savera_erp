import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/app_utilities/app_images.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/notifiers/home/home_cubit.dart';
import 'package:savera_erp/ui/pages/home/dashboard_summary/dashboard_summary.dart';
import 'package:savera_erp/ui/pages/home/drawer/DxDrawer.dart';
import 'package:savera_erp/ui/pages/home/home_app_bar.dart';
import 'package:savera_erp/ui/widgets/dailog/logout_dailog.dart';
import 'package:savera_erp/ui/widgets/dx_layout_builder.dart';
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
  @override
  void initState() {
    HomeCubit().loadLocalBasicData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: HomeAppBar(),
      body: DashboardSummary(),
      drawer: DxDrawer(
        onItemTapped: (item) {
          Helpers.toast(context, msg: item.title);
        },
      ),
    );
  }
}
