import 'package:flutter/cupertino.dart';
import 'package:savera_erp/models/auth_result.model.dart';
import 'package:savera_erp/blocs/auth/auth_repo.dart';

part 'login_state.dart';

class LoginBloc {
  late AuthRepo authRepo;
  late final stateNotifier = ValueNotifier<LoginState>(LoginInitial());

  Future<void> doLogin(String userName, String password) async {
    try {
      stateNotifier.value = LoginWithResult();
      // stateNotifier.value = LoginLoading();
      // final userDetail = await authRepo.doLogin(
      //   password: password,
      //   username: userName,
      // );
      // if (userDetail.isSuccess) {
      //   stateNotifier.value = LoginWithResult(user: userDetail.data);
      // } else {
      //   stateNotifier.value = LoginWithResult(errorMsg: userDetail.msg);
      // }
    } catch (e) {
      stateNotifier.value = LoginWithResult(errorMsg: e.toString());
    }
  }
}
