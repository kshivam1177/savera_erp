import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/blocs/attendance/attendance_cubit.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/shared/helpers.dart';
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
  final AttendanceCubit attendanceCubit = AttendanceCubit();
  final List<DxDataTableCell<String>> columns = [];

  @override
  void initState() {
    attendanceCubit.getAll();
    columns.addAll([
      DxDataTableCell(flex: 1, value: "SRN"),
      DxDataTableCell(flex: 4, value: "Name"),
      if (!widget.isSummaryView) DxDataTableCell(flex: 3, value: "Designation"),
      DxDataTableCell(flex: 3, value: "Punch In"),
      if (!widget.isSummaryView) DxDataTableCell(flex: 3, value: "Punch Out"),
      if (!widget.isSummaryView)
        DxDataTableCell(flex: 3, value: "Punch Status"),
      DxDataTableCell(flex: 2, value: "Action")
    ]);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: DxCustomTable<String>(
          scrollableAfter: 0,
          columnDefinition: columns,
          data: List.generate(5000, (i) {
            return [
              "${i + 1}",
              "Name Value Here ${i + 1}",
              if (!widget.isSummaryView) "Relationship Manager",
              "${i % 2 == 0 ? DateTime.now().toString() : "N/A"}",
              if (!widget.isSummaryView) "N/A",
              "PUNCHED-IN",
              if (!widget.isSummaryView) "status 2"
            ];
          }),
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
                            title: DxText("View", bold: true, fontSize: 18),
                            content: DxText("Viewing details"),
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
                      // todo: change map api key
                      RouteHelper.toMapView(
                        context,
                        attendanceId: 1,
                        empName: "Name Value Here 1",
                      );
                    },
                  ),
                ],
              );

            return DxText(value);
          },
        ),
      ),
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
