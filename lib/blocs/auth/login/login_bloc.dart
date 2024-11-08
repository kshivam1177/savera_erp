import 'package:flutter/cupertino.dart';
import 'package:savera_erp/blocs/auth/auth_repo.dart';
import 'package:savera_erp/models/auth_result.dart';
import 'package:savera_erp/services/storage/preference/preference_handler.dart';

part 'login_state.dart';

class LoginBloc {
  late final stateNotifier = ValueNotifier<LoginState>(LoginInitial());

  Future<void> doLogin(String userName, String password) async {
    try {
      stateNotifier.value = LoginLoading();
      final userDetail = await AuthRepo().doLogin(
        password: password,
        username: userName,
      );
      if (userDetail.status.success) {
        await PrefHandler.setUserId(userDetail.data!.userId);
        await PrefHandler.setLoginId(userDetail.data!.loginId);
        await PrefHandler.setAuthResult(userDetail.data!);
        stateNotifier.value = LoginWithResult(user: userDetail.data);
      } else {
        await PrefHandler.clearPref();
        stateNotifier.value = LoginWithResult(errorMsg: userDetail.msg);
      }
    } catch (e, stackTrace) {
      stateNotifier.value = LoginWithResult(errorMsg: e.toString());
    }
  }
}
