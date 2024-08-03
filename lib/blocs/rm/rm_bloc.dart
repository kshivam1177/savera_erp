import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/rm/rm_repo.dart';
import 'package:savera_erp/models/rm/rm_list_for_login_item.dart';

part 'rm_state.dart';

class RMBloc {
  final rmRepo = RMRepo();
  final rmListNotifier = ValueNotifier<RMState>(RMInitial());

  Future<void> getAll() async {
    rmListNotifier.value = RMInitial();
    final result = await rmRepo.getAllRMs();

    if (result.status.success) {
      rmListNotifier.value = RMLoaded(data: result.data!);
    } else {
      rmListNotifier.value = RMError(result.msg);
    }
  }
}
