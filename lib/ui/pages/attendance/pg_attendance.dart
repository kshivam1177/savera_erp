import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/attendance/attendance_bloc.dart';
import 'package:savera_erp/models/attendance/rm_list_attendance_item.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';
import 'package:savera_erp/ui/pages/attendance/attendance_detail.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/widgets/app_bar/search_app_bar.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_button_fab.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_icon_button.dart';
import 'package:savera_erp/ui/widgets/custom/date_filter.dart';
import 'package:savera_erp/ui/widgets/custom/dx_center_text.dart';
import 'package:savera_erp/ui/widgets/custom/dx_tool_tip.dart';
import 'package:savera_erp/ui/widgets/custom/table/dx_custom_table.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class PgAttendance extends StatefulWidget {
  static const String routeName = '/attendance';
  final bool isSummaryView;

  const PgAttendance({
    this.isSummaryView = false,
    super.key,
  });

  @override
  State<PgAttendance> createState() => _PgAttendanceState();
}

class _PgAttendanceState extends State<PgAttendance> {
  final AttendanceBloc attendanceCubit = AttendanceBloc();
  final ValueNotifier<String> searchQuery = ValueNotifier<String>('');
  final List<DxDataTableCell<String>> columns = [];
  DateTime selectedDate = DateTime.now();

  @override
  void initState() {
    attendanceCubit.getAll(date: selectedDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.isSummaryView
          ? null
          : SearchAppBar(
              title: "Attendance",
              hintText: "Search staff by name...",
              // showBackButton: false,
              actionBtns: [
                DatePicker(
                  onSelected: (date) {
                    selectedDate = date;
                    attendanceCubit.getAll(date: selectedDate);
                  },
                ),
              ],
              onBtnClick: (bool value) {},
              onQueryChanged: (String value) {
                searchQuery.value = value;
              },
            ),
      body: ValueListenableBuilder<AttendanceState>(
        valueListenable: attendanceCubit.rmListNotifier,
        builder: (context, value, child) {
          if (value is AttendanceInitial) {
            return Center(child: CircularProgressIndicator());
          }
          if (value is AttendanceError) {
            return DxCenterText(text: value.error);
          }
          final state = value as RmListAttendanceLoaded;
          if (state.items.isEmpty) {
            return DxCenterText(
              text:
                  "Records not found for ${DxDateUtils.getDateString(selectedDate)}",
            );
          }
          columns.clear();
          columns.addAll([
            DxDataTableCell(flex: 1, value: "SRN"),
            DxDataTableCell(flex: 4, value: "Name"),
            if (!widget.isSummaryView)
              DxDataTableCell(flex: 3, value: "Designation"),
            DxDataTableCell(flex: 3, value: "Punch In"),
            DxDataTableCell(flex: 3, value: "Punch Out"),
            DxDataTableCell(flex: 2, value: "Action")
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
              data: List.generate(state.items.length, (index) {
                final e = state.items[index];
                return [
                  "${index + 1}",
                  e.staffName,
                  if (!widget.isSummaryView) e.staffDesignation,
                  e.punchInDate,
                  e.punchOutDate,
                  ""
                ];
              }),
              buildCell: (value, rowIndex, columnIndex) {
                if (columns[columnIndex].value == "Action") {
                  return DxCellView(
                    child: _AttendanceActionItems(
                      isSummaryView: widget.isSummaryView,
                      item: state.items[rowIndex],
                      dateTime: selectedDate,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 4),
                  );
                }
                return DxCellView(
                  child: DxToolTip(
                    tooltip: columnIndex == 0
                        ? "Staff Id:${state.items[rowIndex].staffId}"
                        : "$value",
                    child: DxText(value, fontSize: 14),
                  ),
                );
              },
            ),
          );
        },
      ),
      bottomNavigationBar: !widget.isSummaryView
          ? null
          : BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: DxTextBlack(
                        "View Attendance Summary in Detail",
                        bold: true,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(
                      height: 35,
                      width: 130,
                      child: DxFabExtended(
                        onPressed: () {
                          RouteHelper.toAttendanceList(context);
                        },
                        text: 'Detail View > ',
                        backgroundColor: AppColors.primary,
                        radius: 25,
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

class _AttendanceActionItems extends StatelessWidget {
  final bool isSummaryView;
  final RmListAttendanceItem item;
  final DateTime dateTime;

  const _AttendanceActionItems({
    required this.isSummaryView,
    required this.item,
    required this.dateTime,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        DxIconButton(
          icon: Icon(
            CupertinoIcons.eye,
            size: 20,
          ),
          tooltip: "Details of ${item.staffName}",
          onTap: () {
            showAdaptiveDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: DxText(
                    "Details of ${item.staffName}",
                    bold: true,
                    fontSize: 18,
                  ),
                  content: AttendanceDetail(item: item),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"),
                    ),
                  ],
                );
              },
            );
          },
        ),
        DxIconButton(
          icon: Icon(
            CupertinoIcons.location,
            color: AppColors.navyBlue,
            size: 20,
          ),
          tooltip: "View on Map",
          onTap: () {
            RouteHelper.toMapView(
              context,
              empId: item.staffId,
              fromDate: DxDateUtils.getStartOfDay(dateTime),
              toDate: DxDateUtils.getEndOfDay(dateTime),
              routePlanId: item.routePlanId,
              empName: item.staffName,
            );
          },
        ),
      ],
    );
  }
}
