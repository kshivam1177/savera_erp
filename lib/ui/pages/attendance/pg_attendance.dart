import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:savera_erp/app_utilities/helpers.dart';
import 'package:savera_erp/blocs/attendance/attendance_cubit.dart';
import 'package:savera_erp/route/route_helper.dart';
import 'package:savera_erp/ui/widgets/custom/table/dx_custom_table.dart';
import 'package:savera_erp/ui/widgets/custom/text/dx_text.dart';

class PgAttendance extends StatefulWidget {
  static const String routeName = '/attendance';

  const PgAttendance({super.key});

  @override
  State<PgAttendance> createState() => _PgAttendanceState();
}

class _PgAttendanceState extends State<PgAttendance> {
  final AttendanceCubit attendanceCubit = AttendanceCubit();
  final List<DxDataTableCell<String>> columns = [
    DxDataTableCell(flex: 1, value: "SRN"),
    DxDataTableCell(flex: 4, value: "Name"),
    DxDataTableCell(flex: 3, value: "Designation"),
    DxDataTableCell(flex: 3, value: "Punch In"),
    DxDataTableCell(flex: 3, value: "Punch Out"),
    DxDataTableCell(flex: 3, value: "Punch Status"),
    DxDataTableCell(flex: 2, value: "Action")
  ];

  @override
  void initState() {
    attendanceCubit.getAll();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              "Relationship Manager",
              "${i % 2 == 0 ? DateTime.now().toString() : "N/A"}",
              "N/A",
              "PUNCHED-IN",
              "status 2"
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
                      width: 45,
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
                          });
                    },
                  ),
                  InkWell(
                    child: SizedBox(
                      width: 45,
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
    );
  }
}