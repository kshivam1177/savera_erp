import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/attendance/attendance_repo.dart';
import 'package:savera_erp/models/attendance/rm_list_attendance_item.dart';

part 'attendance_state.dart';

class AttendanceBloc {
  final attendanceRepo = AttendanceRepo();
  final rmListNotifier = ValueNotifier<AttendanceState>(AttendanceInitial());
  final locationNotifier = ValueNotifier<AttendanceState>(AttendanceInitial());

  Future<void> getAll({
    required DateTime date,
  }) async {
    rmListNotifier.value = AttendanceInitial();
    final result = await attendanceRepo.getAll(date: date);

    if (result.status.success) {
      rmListNotifier.value = RmListAttendanceLoaded(items: result.data!);
    } else {
      rmListNotifier.value = AttendanceError(result.msg);
    }
  }

  Future<void> getLocations({
    required int empId,
    required int routePlanId,
    required DateTime fromDate,
    required DateTime toDate,
  }) async {
    locationNotifier.value = AttendanceInitial();
    final result = await attendanceRepo.getLocations(
      empId: empId,
      routePlanId: routePlanId,
      fromDate: fromDate,
      toDate: toDate,
    );

    if (result.status.success) {
      locationNotifier.value = RmLocationsLoaded(locations: result.data!);
    } else {
      locationNotifier.value = AttendanceError(result.msg);
    }
  }
}
