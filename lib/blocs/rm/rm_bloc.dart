import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/auth/auth_repo.dart';
import 'package:savera_erp/blocs/rm/rm_repo.dart';
import 'package:savera_erp/models/rm/rm_list_for_login_item.dart';
import 'package:savera_erp/ui/widgets/dailog/common_dialog.dart';

part 'rm_state.dart';

class RMBloc {
  late final rmRepo = RMRepo();
  late final authRepo = AuthRepo();
  late final rmListNotifier = ValueNotifier<RMState>(RMInitial());
  late final rmCreateNotifier = ValueNotifier<RMCreateState>(RMCreateInitial());

  Future<void> getAll() async {
    rmListNotifier.value = RMInitial();
    final result = await rmRepo.getAllRMs();

    if (result.status.success) {
      rmListNotifier.value = RMLoaded(data: result.data!);
    } else {
      rmListNotifier.value = RMError(result.msg);
    }
  }

  Future<void> createMobileUser(
    BuildContext context, {
    required RmListLoginItem rm,
    required String username,
    required String password,
  }) async {
    if (rm.staffPhone.length != 10) {
      commonDialog(
        context,
        "Invalid Phone Number",
        isSuccess: false,
      );
      return;
    }
    if (username.isEmpty) {
      commonDialog(
        context,
        "Username is required",
        isSuccess: false,
      );
      return;
    }
    if (username.length < 3) {
      commonDialog(
        context,
        "Username must be at least 3 characters",
        isSuccess: false,
      );
      return;
    }
    if (username.length > 15) {
      commonDialog(
        context,
        "Password must not be more than 15 characters",
        isSuccess: false,
      );
      return;
    }

    if (password.isEmpty) {
      commonDialog(
        context,
        "Password is required",
        isSuccess: false,
      );
      return;
    }
    if (password.length < 4) {
      commonDialog(
        context,
        "Password must be at least 4 characters",
        isSuccess: false,
      );
      return;
    }
    if (password.length > 15) {
      commonDialog(
        context,
        "Password must not be more than 15 characters",
        isSuccess: false,
      );
      return;
    }

    rmCreateNotifier.value = RMCreating(rm.staffId);
    final result = await authRepo.createMobileUser(
      phone: rm.staffPhone,
      username: username,
      password: password,
      userTypeId: 6,
    );
    rmCreateNotifier.value = RMCreated(
      rm.staffId,
      msg: result.msg,
      isCreated: result.status.success,
    );
  }

  Future<void> markMobileUserInactive(
    BuildContext context,
    RmListLoginItem rm,
  ) async {
    // if (rm.loginInactiveOn.isNotEmpty) {
    //   commonDialog(
    //     context,
    //     "User is already inactive",
    //     isSuccess: false,
    //   );
    //   return;
    // }
    if (rm.loginDeletedOn.isNotEmpty) {
      commonDialog(
        context,
        "User is already deleted, you can't mark it inactive",
        isSuccess: false,
      );
      return;
    }

    rmCreateNotifier.value = RMCreating(rm.staffId);
    final result = await authRepo.toggleUserActiveStatus(
      userId: rm.staffId,
      userTypeId: rm.userTypeId,
      markActive: rm.loginInactiveOn.isNotEmpty,
    );
    rmCreateNotifier.value = RMMarkedInactive(
      rm.staffId,
      msg: result.msg,
      isInactive: result.status.success,
    );
  }
}
