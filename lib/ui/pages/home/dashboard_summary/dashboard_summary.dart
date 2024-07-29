import 'package:flutter/material.dart';
import 'package:savera_erp/ui/pages/attendance/pg_attendance.dart';
import 'package:savera_erp/ui/pages/home/dashboard_summary/grid_data.dart';
import 'package:savera_erp/ui/widgets/dx_layout_builder.dart';

import '../../../widgets/charts/bar/bar_chart_sample1.dart';
import '../../../widgets/charts/bar/bar_chart_sample2.dart';
import '../../../widgets/charts/bar/bar_chart_sample3.dart';
import '../../../widgets/charts/line/line_chart_sample2.dart';
import '../../../widgets/charts/pie/pie_chart_sample2.dart';

class DashboardSummary extends StatefulWidget {
  const DashboardSummary({
    super.key,
  });

  @override
  State<DashboardSummary> createState() => _DashboardSummaryState();
}

class _DashboardSummaryState extends State<DashboardSummary> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DxLayoutBuilder(
      buildView: (context, deviceType) {
        final size = MediaQuery.sizeOf(context);
        switch (deviceType) {
          case DxLayoutType.mobile:
            return getMobileView(context, size);
          case DxLayoutType.tab:
            return getTabView(context, size);
          case DxLayoutType.smallTab:
            return getSmallTabView(context, size);
          case DxLayoutType.desktop:
            return getDesktopView(context, size);
        }
      },
    );
  }

  Widget getMobileView(BuildContext context, Size size) {
    double height = size.height * 0.45;
    double widget = size.width * 0.95;
    return Container(
      color: Colors.greenAccent.shade100,
      margin: EdgeInsets.all(10),
      child: ListView(
        children: [
          SizedBox(
            height: height,
            width: widget,
            child: Card(child: PgAttendance()),
            // child: Card(child: GridData()),
          ),
          SizedBox(
            height: height,
            width: widget,
            child: Card(child: PieChartSample2()),
          ),
          SizedBox(
            height: height,
            width: widget,
            child: Card(child: LineChartSample2()),
          ),
          SizedBox(
            height: height,
            width: widget,
            child: Card(child: BarChartSample2()),
          ),
          SizedBox(
            height: height,
            width: widget,
            child: Card(child: BarChartSample3()),
          ),
          SizedBox(
            height: height,
            width: widget,
            child: Card(child: BarChartSample1()),
          ),
        ],
      ),
    );
  }

  Widget getTabView(BuildContext context, Size size) {
    double height = size.height * 0.45;
    double widget = size.width * 0.45;
    return Container(
      color: Colors.blue.shade100,
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: PieChartSample2()),
                ),
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: LineChartSample2()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: GridData()),
                ),
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: BarChartSample3()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: BarChartSample2()),
                ),
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: BarChartSample1()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getSmallTabView(BuildContext context, Size size) {
    double height = size.height * 0.45;
    double widget = size.width * 0.45;

    return Container(
      color: Colors.blue.shade100,
      margin: EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: PieChartSample2()),
                ),
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: LineChartSample2()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: GridData()),
                ),
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: BarChartSample3()),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: BarChartSample2()),
                ),
                SizedBox(
                  height: height,
                  width: widget,
                  child: Card(child: BarChartSample1()),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getDesktopView(BuildContext context, Size size) {
    double height = size.height * 0.45;
    double widget = size.width * 0.32;

    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height,
                width: widget,
                child: Card(
                  child: PgAttendance(isSummaryView: true,),
                  elevation: 0,
                ),
              ),
              SizedBox(
                height: height,
                width: widget,
                child: Card(
                  child: PieChartSample2(),
                  elevation: 0,
                ),
              ),
              SizedBox(
                height: height,
                width: widget,
                child: Card(
                  child: LineChartSample2(),
                  elevation: 0,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: height,
                width: widget,
                child: Card(
                  child: BarChartSample2(),
                  elevation: 0,
                ),
              ),
              SizedBox(
                height: height,
                width: widget,
                child: Card(
                  child: BarChartSample3(),
                  elevation: 0,
                ),
              ),
              SizedBox(
                height: height,
                width: widget,
                child: Card(
                  child: BarChartSample1(),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
