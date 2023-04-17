import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/screens/chart_screens/expense_chart.dart';
import 'package:tracker/screens/chart_screens/full_chart.dart';
import 'package:tracker/screens/chart_screens/income_chart.dart';

import '../../widgets/appBar/appbar.dart';

class ScreenCircleChart extends StatefulWidget {
   const ScreenCircleChart({super.key});

  @override
  State<ScreenCircleChart> createState() => _ScreenCircleChartState();
}

class _ScreenCircleChartState extends State<ScreenCircleChart> {
  int currentSelectedIndex = 0;

  final pages = [
    const ScreenFullChart(),
    const ScreenIncomeChart(),
    const ScreenExpenseChart()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentSelectedIndex],
      backgroundColor: backBlack,
      appBar:const PreferredSize(
          preferredSize:  Size.fromHeight(55),
          //AppBar
          child: WidgetAppBar(title: 'Observe')),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: gradBlue,
        selectedItemColor: backBlack,
        unselectedItemColor: gradGreen,
        currentIndex: currentSelectedIndex,
        onTap: (value) {
          setState(() {
            currentSelectedIndex = value;
          });
        },
        items:const [
        BottomNavigationBarItem(icon: Icon(Icons.incomplete_circle),label: 'All'),
        BottomNavigationBarItem(icon: Icon(Icons.money),label: 'Income'),
        BottomNavigationBarItem(icon: Icon(Icons.shopify_rounded),label: 'Expense'),
      ]),
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter