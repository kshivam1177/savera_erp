import 'package:flutter/material.dart';

import 'charts/bar/bar_chart_sample1.dart';
import 'charts/bar/bar_chart_sample2.dart';
import 'charts/bar/bar_chart_sample3.dart';
import 'charts/bar/bar_chart_sample4.dart';
import 'charts/bar/bar_chart_sample7.dart';
import 'charts/bar/bar_chart_sample8.dart';
import 'charts/line/line_chart_sample1.dart';
import 'charts/line/line_chart_sample2.dart';
import 'charts/line/line_chart_sample3.dart';
import 'charts/line/line_chart_sample4.dart';
import 'charts/line/line_chart_sample5.dart';
import 'charts/line/line_chart_sample6.dart';
import 'charts/line/line_chart_sample7.dart';
import 'charts/line/line_chart_sample9.dart';
import 'charts/pie/pie_chart_sample1.dart';
import 'charts/pie/pie_chart_sample2.dart';
import 'charts/pie/pie_chart_sample3.dart';

class DashboardSummary extends StatefulWidget {
  const DashboardSummary({super.key});

  @override
  State<DashboardSummary> createState() => _DashboardSummaryState();
}

class _DashboardSummaryState extends State<DashboardSummary> {
  @override
  void initState() {
    super.initState();
  }

  static final Map<ChartType, List<ChartSample>> samples = {
    ChartType.line: [
      LineChartSample(1, (context) => const LineChartSample1()),
      LineChartSample(2, (context) => const LineChartSample2()),
      // LineChartSample(3, (context) => LineChartSample3()),
      // LineChartSample(4, (context) => LineChartSample4()),
      LineChartSample(5, (context) => LineChartSample5()),
      // LineChartSample(6, (context) => LineChartSample6()),
      // LineChartSample(7, (context) => LineChartSample7()),
      LineChartSample(9, (context) => LineChartSample9()),
      // LineChartSample(10, (context) => const LineChartSample10()),
    ],
    ChartType.bar: [
      BarChartSample(1, (context) => BarChartSample1()),
      BarChartSample(2, (context) => BarChartSample2()),
      BarChartSample(3, (context) => const BarChartSample3()),
      BarChartSample(4, (context) => BarChartSample4()),
      BarChartSample(7, (context) => BarChartSample7()),
      // BarChartSample(8, (context) => BarChartSample8()),
    ],
    ChartType.pie: [
      PieChartSample(1, (context) => const PieChartSample1()),
      PieChartSample(2, (context) => const PieChartSample2()),
      PieChartSample(3, (context) => const PieChartSample3()),
    ]
  };

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          body: Column(
            children: [
              Row(
                children: samples[ChartType.bar]!.map((e) {
                  return Expanded(
                    child: Card(
                      child: e.builder(context),
                    ),
                  );
                }).toList(),
              ),
              Row(
                children: samples[ChartType.line]!.map((e) {
                  return Expanded(
                    child: Card(
                      child: e.builder(context),
                    ),
                  );
                }).toList(),
              )
            ],
          ),
        );
      },
    );
  }
}

abstract class ChartSample {
  final int number;
  final WidgetBuilder builder;

  ChartType get type;

  String get name => '${type.name} Sample $number';

  String get url => "Urls.getChartSourceCodeUrl(type, number)";

  ChartSample(this.number, this.builder);
}

class LineChartSample extends ChartSample {
  LineChartSample(super.number, super.builder);

  @override
  ChartType get type => ChartType.line;
}

class BarChartSample extends ChartSample {
  BarChartSample(super.number, super.builder);

  @override
  ChartType get type => ChartType.bar;
}

class PieChartSample extends ChartSample {
  PieChartSample(super.number, super.builder);

  @override
  ChartType get type => ChartType.pie;
}

enum ChartType { line, bar, pie }
