part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class Homeinitial extends HomeState {}

class HomeLoaded extends HomeState {
  final AuthResult? userModel;
  final bool displayWallet;

  HomeLoaded({
    this.userModel,
    this.displayWallet = false,
  });
}

class HomeSmLoaded extends HomeState {
  final AuthResult? userModel;
  final bool? displayWholesaleButton;

  HomeSmLoaded({
    this.userModel,
    this.displayWholesaleButton = false,
  });
}

class HomeLoadingWallet extends HomeState {
  final AuthResult? userModel;
  final bool? displayWallet;

  HomeLoadingWallet({this.userModel, this.displayWallet = false});
}

class HomeError extends HomeState {
  final String error;

  HomeError(this.error);
}

class HomeWalletError extends HomeState {
  final String error;
  final AuthResult userModel;

  HomeWalletError(this.userModel, this.error);
}
