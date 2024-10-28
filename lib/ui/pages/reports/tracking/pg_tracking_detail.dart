import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/reports/tracking_detail/tracking_detail_bloc.dart';
import 'package:savera_erp/models/reports/from_date_to_date.dart';
import 'package:savera_erp/models/reports/tracking_report/tracking_report_item.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/widgets/app_bar/search_app_bar.dart';
import 'package:savera_erp/ui/widgets/bottom_sheets/bottom_sheet_date_filter.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_icon_button.dart';
import 'package:savera_erp/ui/widgets/custom/dx_center_text.dart';
import 'package:savera_erp/ui/widgets/custom/table/dx_custom_table.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class PgTrackingDetail extends StatefulWidget {
  static const String routeName = '/tracking-detail';
  final DateRangeFilter filter;
  final VisitTrackingItem row;

  const PgTrackingDetail({
    required this.row,
    required this.filter,
    super.key,
  });

  @override
  State<PgTrackingDetail> createState() => _PgTrackingDetailState();
}

class _PgTrackingDetailState extends State<PgTrackingDetail> {
  final TrackingDetailBloc bloc = TrackingDetailBloc();
  final ValueNotifier<String> searchQuery = ValueNotifier<String>('');
  final List<DxDataTableCell<String>> columns = [];

  @override
  void initState() {
    bloc.onLoad(widget.row.staffId, widget.filter);
    bloc.trackingDetailNotifier.addListener(() {
      final state = bloc.trackingDetailNotifier.value;
      if (state is TrackingDetailLoaded) {
        if (state.showFilter) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  child: DateRangePicker(
                    filter: state.filter,
                    apply: (filter) {
                      bloc.applyFilter(filter);
                    },
                  ),
                );
              },
            );
          });
          return;
        }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: "${widget.row.staffName} Visits",
        hintText: "Search by name...",
        subTitle: bloc.filterSubtitle,
        showSearchIcon: false,
        onBtnClick: (bool value) {},
        onQueryChanged: (String value) {
          searchQuery.value = value;
        },
        actionBtns: [
          IconButton(
            tooltip: "Filter",
            icon: Icon(CupertinoIcons.line_horizontal_3_decrease),
            onPressed: () {
              bloc.openFilter();
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<TrackingDetailState>(
        valueListenable: bloc.trackingDetailNotifier,
        builder: (context, value, child) {
          if (value is TrackingDetailLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (value is TrackingDetailError) {
            return DxCenterText(text: value.error);
          }
          final state = value as TrackingDetailLoaded;
          if (state.data.isEmpty) {
            return DxCenterText(
              text: "Visits not found ",
            );
          }
          columns.clear();
          columns.addAll([
            DxDataTableCell(flex: 1, value: "Plan Id"),
            DxDataTableCell(flex: 4, value: "Date"),
            DxDataTableCell(flex: 1, value: "Visit Count"),
            DxDataTableCell(flex: 1, value: "Travelled (Km)"),
            DxDataTableCell(flex: 3, value: "Punched In"),
            DxDataTableCell(flex: 3, value: "Punched Out"),
            DxDataTableCell(flex: 1, value: "Visits"),
          ]);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: DxCustomTable<String>(
              scrollableAfter: 0,
              searchQuery: searchQuery,
              columnDefinition: columns,
              searchFilter: (data, index) {
                return data[1].toLowerCase().contains(searchQuery.value);
              },
              data: state.data.map((e) {
                return [
                  "${e.routePlanId}",
                  e.date,
                  e.visitCount.toString(),
                  e.travelledKm.toStringAsFixed(2),
                  e.punchedIn,
                  e.punchedOut,
                  "Visits"
                ];
              }).toList(),
              buildCell: (value, rowIndex, columnIndex) {
                if (columnIndex < 6) {
                  return DxCellView(
                    child: DxText(value, fontSize: 14),
                  );
                } else {
                  return DxCellView(
                    child: DxIconButton(
                      tooltip: "View on Map",
                      icon: Icon(
                        CupertinoIcons.location,
                        color: AppColors.navyBlue,
                        size: 20,
                      ),
                      onTap: () {
                        RouteHelper.toMapView(
                          context,
                          empId: widget.row.staffId,
                          empName: widget.row.staffName,
                          fromDate: widget.filter.from,
                          toDate: widget.filter.to,
                          routePlanId: state.data[rowIndex].routePlanId,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          );
        },
      ),
    );
  }
}
