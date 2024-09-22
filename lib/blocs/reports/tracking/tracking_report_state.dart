part of 'tracking_report_bloc.dart';

@immutable
abstract class TrackingReportState {}

class TrackingReportLoading extends TrackingReportState {}

class TrackingReportLoaded extends TrackingReportState {
  final List<VisitTrackingItem> data;
  final DateRangeFilter filter;
  final bool showFilter;

  TrackingReportLoaded({
    required this.data,
    required this.filter,
    this.showFilter = false,
  });
}

class TrackingReportError extends TrackingReportState {
  final String error;

  TrackingReportError(this.error);
}
