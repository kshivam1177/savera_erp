part of 'login_notifier.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginWithResult extends LoginState {
  final String? errorMsg;
  final AuthResult? user;

  LoginWithResult({
    this.errorMsg,
    this.user,
  });
}
