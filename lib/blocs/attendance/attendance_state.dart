part of 'attendance_bloc.dart';

@immutable
abstract class AttendanceState {}

class AttendanceInitial extends AttendanceState {}

class RmListAttendanceLoaded extends AttendanceState {
  final List<RmListAttendanceItem> items;

  RmListAttendanceLoaded({required this.items});
}

class RmLocationsLoaded extends AttendanceState {
  final List<LocationItem> locations;

  RmLocationsLoaded({required this.locations});
}

class AttendanceError extends AttendanceState {
  final String error;

  AttendanceError(this.error);
}
