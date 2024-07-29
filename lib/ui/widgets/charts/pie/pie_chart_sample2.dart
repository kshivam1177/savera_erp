import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:savera_erp/ui/theme/app_colors.dart';
import 'package:savera_erp/ui/utils/dx_app_decoration.dart';

import '../indicator.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          const SizedBox(
            height: 18,
          ),
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: AppColors.navyBlue.shade500,
                text: 'First',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.yellow,
                text: 'Second',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.pink,
                text: 'Third',
                isSquare: false,
              ),
              SizedBox(
                height: 4,
              ),
              Indicator(
                color: AppColors.green,
                text: 'Fourth',
                isSquare: false,
              ),
              SizedBox(height: 18),
            ],
          ),
          const SizedBox(
            width: 28,
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 22.0 : 14.0;
      final radius = isTouched ? 60.0 : 50.0;
      // const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: AppColors.navyBlue,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: AppStyles.getTextStyle(
              true,
              fontSize,
              color: AppColors.white,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.yellow,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: AppStyles.getTextStyle(
              true,
              fontSize,
              color: AppColors.white,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: AppColors.pink,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: AppStyles.getTextStyle(
              true,
              fontSize,
              color: AppColors.white,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: AppColors.green,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: AppStyles.getTextStyle(
              true,
              fontSize,
              color: AppColors.white,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
