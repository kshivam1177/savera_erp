import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savera_erp/models/auth_result.model.dart';
import 'package:savera_erp/notifiers/auth/auth_repo.dart';

part 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  late AuthRepo authRepo;

  LoginNotifier(this.authRepo) : super(LoginWithResult());

  Future<void> doLogin(String userName, String password) async {
    try {
      state = LoginLoading();
      final userDetail = await authRepo.doLogin(
        password: password,
        username: userName,
      );
      if (userDetail.isSuccess) {
        state = LoginWithResult(user: userDetail.data);
      } else {
        state = LoginWithResult(errorMsg: userDetail.msg);
      }
    } catch (e) {
      state = LoginWithResult(errorMsg: e.toString());
    }
  }
}
