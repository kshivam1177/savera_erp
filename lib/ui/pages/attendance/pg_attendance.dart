import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/attendance/attendance_bloc.dart';
import 'package:savera_erp/models/attendance/rm_list_attendance_item.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/shared/dx_date_utils.dart';
import 'package:savera_erp/shared/helpers.dart';
import 'package:savera_erp/ui/pages/attendance/attendance_detail.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/widgets/custom/button/dx_button_fab.dart';
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
          : AppBar(
              centerTitle: false,
              title: DxText(
                'Attendance',
                fontSize: 18,
                bold: true,
              ),
              backgroundColor: Colors.white,
              elevation: 1,
              leading: null,
              actions: [
                IconButton(
                  icon: Icon(
                    CupertinoIcons.search,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Helpers.toast(context, msg: "Let me search for you");
                  },
                ),
              ],
            ),
      body: ValueListenableBuilder<AttendanceState>(
          valueListenable: attendanceCubit.rmListNotifier,
          builder: (context, value, child) {
            if (value is AttendanceInitial) {
              return Center(child: CircularProgressIndicator());
            }
            if (value is AttendanceError) {
              return Center(child: DxText(value.error));
            }
            final state = value as RmListAttendanceLoaded;
            columns.clear();
            columns.addAll([
              DxDataTableCell(flex: 1, value: "Id"),
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
                columnDefinition: columns,
                data: state.items.map((e) {
                  return [
                    "${e.staffId}",
                    e.staffName,
                    if (!widget.isSummaryView) e.staffDesignation,
                    e.punchInDate,
                    e.punchOutDate,
                    ""
                  ];
                }).toList(),
                buildCell: (value, rowIndex, columnIndex) {
                  if (columns[columnIndex].value == "Action")
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          child: SizedBox(
                            width: widget.isSummaryView ? 30 : 45,
                            child: Icon(
                              CupertinoIcons.eye,
                              size: 15,
                            ),
                          ),
                          onTap: () {
                            showAdaptiveDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: DxText(
                                    "Details of ${state.items[rowIndex].staffName}",
                                    bold: true,
                                    fontSize: 18,
                                  ),
                                  content: AttendanceDetail(
                                    item: state.items[rowIndex],
                                  ),
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
                        InkWell(
                          child: SizedBox(
                            width: widget.isSummaryView ? 30 : 45,
                            child: Icon(
                              CupertinoIcons.map_pin_ellipse,
                              size: 15,
                              color: Colors.green,
                            ),
                          ),
                          onTap: () {
                            RouteHelper.toMapView(
                              context,
                              empId: state.items[rowIndex].staffId,
                              fromDate: DxDateUtils.getStartOfDay(selectedDate),
                              toDate: DxDateUtils.getEndOfDay(selectedDate),
                              routePlanId: state.items[rowIndex].routePlanId,
                              empName: state.items[rowIndex].staffName,
                            );
                          },
                        ),
                      ],
                    );

                  return DxText(value);
                },
              ),
            );
          }),
      bottomNavigationBar: !widget.isSummaryView
          ? null
          : BottomAppBar(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DxTextBlack(
                      "View Attendance Summary in Detail",
                      bold: true,
                      fontSize: 16,
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
                          fontSize: 12,
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
