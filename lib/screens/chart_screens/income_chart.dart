import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class ScreenIncomeChart extends StatefulWidget {
   const ScreenIncomeChart({super.key});

  @override
  State<ScreenIncomeChart> createState() => _ScreenIncomeChartState();
}

class _ScreenIncomeChartState extends State<ScreenIncomeChart> {
  Map<String, double> incomeData = {
    "Salary": 5,
    "School": 3,
    "Bike": 5,
    "Car": 3,
    "Bag": 5,
    "Lap": 3,
  };

  @override
  Widget build(BuildContext context) {
    return PieChart(
      colorList:const [
         Color.fromARGB(255, 206, 164, 52),
          Color.fromARGB(255, 175, 141, 46),
           Color.fromARGB(255, 170, 149, 91),
          Color.fromARGB(255, 95, 90, 76),
           Color.fromARGB(255, 224, 208, 164),
          Color.fromARGB(255, 116, 114, 111),
           Color.fromARGB(255, 107, 80, 4),
          Color.fromARGB(255, 255, 195, 29),
      ],
        // centerTextStyle: TextStyle(color: Colors.white),
        // animationDuration: Duration(seconds: 1),
        dataMap: incomeData,
        chartValuesOptions: const ChartValuesOptions(
          showChartValueBackground: false,
        ),
      );
  }
}