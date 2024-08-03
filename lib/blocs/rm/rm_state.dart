part of 'rm_bloc.dart';

@immutable
abstract class RMState {}

class RMInitial extends RMState {}

class RMLoaded extends RMState {
  final List<RmListLoginItem> data;

  RMLoaded({required this.data});
}

class RMError extends RMState {
  final String error;

  RMError(this.error);
}
