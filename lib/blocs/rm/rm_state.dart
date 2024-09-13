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

abstract class RMCreateState {}

class RMCreateInitial extends RMCreateState {
  RMCreateInitial();
}

class RMCreating extends RMCreateState {
  final int rowId;

  RMCreating(this.rowId);
}

class RMCreated extends RMCreateState {
  final int rowId;
  final String msg;
  final bool isCreated;

  RMCreated(
    this.rowId, {
    required this.msg,
    required this.isCreated,
  });
}

class RMMarkedInactive extends RMCreateState {
  final int rowId;
  final String msg;
  final bool isInactive;

  RMMarkedInactive(
    this.rowId, {
    required this.msg,
    required this.isInactive,
  });
}
