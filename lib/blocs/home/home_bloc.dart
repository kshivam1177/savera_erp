import 'package:flutter/cupertino.dart';
import 'package:savera_erp/models/auth_result.dart';
import 'package:savera_erp/ui/pages/attendance/pg_attendance.dart';
import 'package:savera_erp/ui/pages/home/drawer/DxDrawer.dart';
import 'package:savera_erp/ui/pages/reports/tracking/pg_tracking_report.dart';
import 'package:savera_erp/ui/pages/rm/pg_rm.dart';

part 'home_state.dart';

class HomeCubit {
  List<ItemData> getMenus() {
    return [
      ItemData(
        title: 'Home',
        route: '/home',
        leading: Icon(CupertinoIcons.home, size: 20),
        id: 1001,
      ),
      ItemData(
        title: 'Attendance',
        route: PgAttendance.routeName,
        leading: Icon(CupertinoIcons.checkmark_rectangle, size: 20),
        id: 1002,
      ),
      ItemData(
        title: 'Relationship Managers',
        route: PgRM.routeName,
        leading: Icon(CupertinoIcons.person_3, size: 25),
        id: 1003,
      ),
      ItemData(
        title: 'Tracking Report',
        route: PgTrackingReport.routeName,
        leading: Icon(CupertinoIcons.list_number, size: 20),
        id: 1004,
      ),
      // ItemData(
      //   title: 'Settings',
      //   route: '/settings',
      //   leading: Icon(CupertinoIcons.list_number, size: 20),
      //   id: 1005,
      //   items: [
      //     ItemData(
      //       title: 'General',
      //       route: '/settings/general',
      //       leading: Icon(CupertinoIcons.square_grid_2x2, size: 20),
      //       id: 10051,
      //     ),
      //     ItemData(
      //       title: 'Tracking',
      //       route: '/settings/tracking',
      //       leading: Icon(CupertinoIcons.location, size: 20),
      //       id: 10052,
      //     ),
      //   ],
      // )
    ];
  }

  void getBasicDetails() async {
    // emit(Homeinitial());
    // UserModel userModel = UserModel(
    //   mUsername: await PrefHandler.getFullName(),
    //   name: await PrefHandler.getAssociatedDealer(),
    //   userType: await PrefHandler.getAssociatedDealerTypw(),
    // );
    // if (userModel.userType == UserTypes.DISTRIBUTOR) {
    //   // emit(HomeSmLoaded(userModel: userModel, displayWholesaleButton: true));
    // } else {
    //   // emit(HomeSmLoaded(userModel: userModel, displayWholesaleButton: false));
    // }
  }
}
