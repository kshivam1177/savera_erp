import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/reports/tracking_report_repo.dart';
import 'package:savera_erp/models/reports/from_date_to_date.dart';
import 'package:savera_erp/models/reports/tracking_report/tracking_report_item.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';

part 'tracking_detail_state.dart';

class TrackingDetailBloc {
  late final rptRepo = TrackingReportRepo();
  late final trackingDetailNotifier =
      ValueNotifier<TrackingDetailState>(TrackingDetailLoading());

  late DateRangeFilter _filter;
  late int _empId;

  String get filterSubtitle {
    return "From ${DxDateUtils.getFormattedDate(
      _filter.from,
      isSlashed: false,
    )} to ${DxDateUtils.getFormattedDate(
      _filter.to,
      isSlashed: false,
    )}";
  }

  void onLoad(int empId, DateRangeFilter filter) {
    _empId = empId;
    _filter = filter;
    applyFilter(filter);
  }

  void openFilter() {
    List<VisitTrackingDetailItem> data = [];
    if (trackingDetailNotifier.value is TrackingDetailLoaded) {
      data = (trackingDetailNotifier.value as TrackingDetailLoaded).data;
    }
    trackingDetailNotifier.value = TrackingDetailLoaded(
      data: data,
      filter: _filter,
      showFilter: true,
    );
  }

  Future<void> applyFilter(DateRangeFilter filter) async {
    _filter = filter;
    trackingDetailNotifier.value = TrackingDetailLoading();
    final result = await rptRepo.getRmVisitsDetail(filter, _empId);

    if (result.status.success) {
      trackingDetailNotifier.value = TrackingDetailLoaded(
        data: result.data!,
        filter: filter,
        showFilter: false,
      );
    } else {
      trackingDetailNotifier.value = TrackingDetailError(result.msg);
    }
  }
}
