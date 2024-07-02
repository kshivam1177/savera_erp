import 'package:flutter/material.dart';
import 'package:savera_erp/ui/pages/home/dashboard_summary/charts/bar/bar_chart_sample2.dart';
import 'package:savera_erp/ui/pages/home/dashboard_summary/charts/bar/bar_chart_sample3.dart';
import 'package:savera_erp/ui/widgets/dx_layout_builder.dart';

import 'charts/bar/bar_chart_sample1.dart';

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
      buildMobileView: (context) {
        double height = MediaQuery.sizeOf(context).height * 0.45;
        double widget = MediaQuery.sizeOf(context).width * 0.95;
        return Container(
          color: Colors.greenAccent.shade100,
          margin: EdgeInsets.all(10),
          child: ListView(
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
        );
      },
      buildSmallTabView: (context) {
        double height = MediaQuery.sizeOf(context).height * 0.45;
        double widget = MediaQuery.sizeOf(context).width * 0.45;
        return Container(
          color: Colors.blue.shade100,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
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
        );
      },
      buildTabView: (context) {
        double height = MediaQuery.sizeOf(context).height * 0.45;
        double widget = MediaQuery.sizeOf(context).width * 0.32;
        return Container(
          color: Colors.red.shade100,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
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
                    child: Card(child: BarChartSample3()),
                  ),
                  SizedBox(
                    height: height,
                    width: widget,
                    child: Card(child: BarChartSample1()),
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
                    child: Card(child: BarChartSample3()),
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
        );
      },
      buildDesktopView: (context) {
        double height = MediaQuery.sizeOf(context).height * 0.45;
        double widget = MediaQuery.sizeOf(context).width * 0.32;
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
                    child: Card(child: BarChartSample3()),
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
        );
      },
    );
  }
}
