import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/reports/tracking_report_repo.dart';
import 'package:savera_erp/models/reports/from_date_to_date.dart';
import 'package:savera_erp/models/reports/tracking_report/tracking_report_item.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';

part 'tracking_report_state.dart';

class TrackingReportBloc {
  late final rptRepo = TrackingReportRepo();
  late final trackingReportNotifier =
      ValueNotifier<TrackingReportState>(TrackingReportLoading());

  late DateRangeFilter _filter = DateRangeFilter.currentMonth();

  DateRangeFilter get filter => _filter;

  String get filterSubtitle {
    return "From ${DxDateUtils.getFormattedDate(
      _filter.from,
      isSlashed: false,
    )} to ${DxDateUtils.getFormattedDate(
      _filter.to,
      isSlashed: false,
    )}";
  }

  void onLoad() {
    List<VisitTrackingItem> data = [];
    if (trackingReportNotifier.value is TrackingReportLoaded) {
      data = (trackingReportNotifier.value as TrackingReportLoaded).data;
    }
    trackingReportNotifier.value = TrackingReportLoaded(
      data: data,
      filter: _filter,
      showFilter: true,
    );
  }

  Future<void> applyFilter(DateRangeFilter filter) async {
    _filter = filter;
    trackingReportNotifier.value = TrackingReportLoading();
    final result = await rptRepo.getRmWiseVisits(filter);

    if (result.status.success) {
      trackingReportNotifier.value = TrackingReportLoaded(
        data: result.data!,
        filter: filter,
        showFilter: false,
      );
    } else {
      trackingReportNotifier.value = TrackingReportError(result.msg);
    }
  }
}
