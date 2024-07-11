part of 'attendance_cubit.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class AttendanceLoaded extends AttendanceState {
  final List<dynamic>? items;

  AttendanceLoaded({this.items});
}

class AttendanceError extends AttendanceState {
  final String error;

  AttendanceError(this.error);
}

class AttendanceWalletError extends AttendanceState {
  final String error;
  final AuthResult userModel;

  AttendanceWalletError(this.userModel, this.error);
}
