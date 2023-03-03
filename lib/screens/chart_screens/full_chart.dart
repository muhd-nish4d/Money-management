import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tracker/problems/amount_totals.dart';

import '../../db_functions/transactions/transaction_db_functions.dart';
import '../../models/transactions/transactions_model.dart';

ValueNotifier<List<TransactionModel>> chartNotifier =
    ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

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
    return ValueListenableBuilder(
      valueListenable: chartNotifier,
      builder: (context, value, child) {
        Map<String, double> totalmappp = {
          'Income': Amounts.instance.incomeResult.value,
          'Expense': Amounts.instance.expenseResult.value,
        };
        return PieChart(dataMap: totalmappp);
      },
    );

    // PieChart(
    //   // centerTextStyle: TextStyle(color: Colors.white),

    //   // animationDuration: Duration(seconds: 1),
    //   colorList: const [
    //     Color.fromARGB(255, 206, 164, 52),
    //     Color.fromARGB(255, 255, 231, 167),
    //   ],
    //   dataMap: dataMap,
    //   chartValuesOptions: const ChartValuesOptions(
    //       showChartValueBackground: false,
    //       chartValueStyle: TextStyle(
    //           fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
    //       showChartValuesInPercentage: true),
    // );
  }
}
