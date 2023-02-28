import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenFullChart extends StatefulWidget {
   const ScreenFullChart({super.key});

  @override
  State<ScreenFullChart> createState() => _ScreenFullChartState();
}

class _ScreenFullChartState extends State<ScreenFullChart> {
  Map<String, double> dataMap = {
    "Income": 5,
    "Expense": 3,
  };

  @override
  Widget build(BuildContext context) {
    return PieChart(
        // centerTextStyle: TextStyle(color: Colors.white),

        // animationDuration: Duration(seconds: 1),
        colorList:const [
           Color.fromARGB(255, 206, 164, 52),
           Color.fromARGB(255, 255, 231, 167),
        ],
        dataMap: dataMap,
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
        ),
      );
  }
}