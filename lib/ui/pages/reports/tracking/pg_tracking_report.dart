import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/reports/tracking/tracking_report_bloc.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/ui/widgets/app_bar/search_app_bar.dart';
import 'package:savera_erp/ui/widgets/bottom_sheets/bottom_sheet_date_filter.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_icon_button.dart';
import 'package:savera_erp/ui/widgets/custom/dx_center_text.dart';
import 'package:savera_erp/ui/widgets/custom/dx_tool_tip.dart';
import 'package:savera_erp/ui/widgets/custom/table/dx_custom_table.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class PgTrackingReport extends StatefulWidget {
  static const String routeName = '/tracking-report';

  const PgTrackingReport({
    super.key,
  });

  @override
  State<PgTrackingReport> createState() => _PgTrackingReportState();
}

class _PgTrackingReportState extends State<PgTrackingReport> {
  final TrackingReportBloc bloc = TrackingReportBloc();
  final ValueNotifier<String> searchQuery = ValueNotifier<String>('');
  final List<DxDataTableCell<String>> columns = [];

  @override
  void initState() {
    bloc.trackingReportNotifier.addListener(() {
      final state = bloc.trackingReportNotifier.value;
      if (state is TrackingReportLoaded) {
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
    bloc.onLoad();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SearchAppBar(
        title: "Tracking Report",
        hintText: "Search by name...",
        subTitle: bloc.filterSubtitle,
        onBtnClick: (bool value) {},
        onQueryChanged: (String value) {
          searchQuery.value = value;
        },
        actionBtns: [
          IconButton(
            tooltip: "Filter",
            icon: Icon(CupertinoIcons.line_horizontal_3_decrease),
            onPressed: () {
              bloc.onLoad();
            },
          ),
        ],
      ),
      body: ValueListenableBuilder<TrackingReportState>(
        valueListenable: bloc.trackingReportNotifier,
        builder: (context, value, child) {
          if (value is TrackingReportLoading) {
            return Center(child: CircularProgressIndicator());
          }
          if (value is TrackingReportError) {
            return DxCenterText(text: value.error);
          }
          final state = value as TrackingReportLoaded;
          if (state.data.isEmpty) {
            return DxCenterText(
              text: "Visits not found ",
            );
          }
          columns.clear();
          columns.addAll([
            DxDataTableCell(flex: 1, value: "SRN"),
            DxDataTableCell(flex: 4, value: "Name"),
            DxDataTableCell(flex: 2, value: "Designation"),
            DxDataTableCell(flex: 2, value: "Travelled Km"),
            DxDataTableCell(flex: 1, value: "Action")
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
              data: List.generate(state.data.length, (index) {
                final e = state.data[index];
                return [
                  "${index + 1}",
                  e.staffName,
                  e.staffDesignation,
                  e.travelledKm.toStringAsFixed(2),
                  ""
                ];
              }).toList(),
              buildCell: (value, rowIndex, columnIndex) {
                if (columns[columnIndex].value == "Action")
                  return DxCellView(
                    child: DxIconButton(
                      tooltip: "Click to view details",
                      icon: DxTextPrimary("Visits > ", size: 14),
                      onTap: () {
                        RouteHelper.toTrackingDetail(
                          context,
                          row: state.data[rowIndex],
                          filter: state.filter,
                        );
                      },
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4),
                  );
                return DxCellView(
                  child: columnIndex == 0
                      ? DxToolTip(
                          tooltip: "Staff Id:${state.data[rowIndex].staffId}",
                          child: DxText(value, fontSize: 14),
                        )
                      : DxText(value, fontSize: 14),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
