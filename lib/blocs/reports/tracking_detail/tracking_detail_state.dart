part of 'tracking_detail_bloc.dart';

@immutable
abstract class TrackingDetailState {}

class TrackingDetailLoading extends TrackingDetailState {}

class TrackingDetailLoaded extends TrackingDetailState {
  final List<VisitTrackingItem> data;
  final DateRangeFilter filter;
  final bool showFilter;

  TrackingDetailLoaded({
    required this.data,
    required this.filter,
    this.showFilter = false,
  });
}

class TrackingDetailError extends TrackingDetailState {
  final String error;

  TrackingDetailError(this.error);
}
