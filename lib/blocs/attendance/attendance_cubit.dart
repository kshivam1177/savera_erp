import 'package:flutter/material.dart';
import 'package:savera_erp/models/auth_result.model.dart';

part 'attendance_state.dart';

class AttendanceCubit {
  final notifier = ValueNotifier<AttendanceState>(AttendanceInitial());

  Future<void> getAll() async {
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
