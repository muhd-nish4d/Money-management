import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';

class ScreenExpenseChart extends StatefulWidget {
  const ScreenExpenseChart({super.key});

  @override
  State<ScreenExpenseChart> createState() => _ScreenExpenseChartState();
}

class _ScreenExpenseChartState extends State<ScreenExpenseChart> {
  Map<String, double> expenseChartData = {'': 0};

  void expenseSetup() {
    expenseChartData.clear();
    for (var item in TransactionDB.instance.transactionListNotifier.value
        .where((element) => element.type == CategoryType.expense)) {
      Map<String, double> datas = {item.category.name: item.amount};
      expenseChartData.addAll(datas);
    }
  }

  @override
  Widget build(BuildContext context) {
    expenseSetup();
    return expenseChartData.isEmpty
        ? const Text('No Values')
        : PieChart(
            // centerTextStyle: TextStyle(color: Colors.white),

            // animationDuration: Duration(seconds: 1),
            dataMap: expenseChartData,
            chartValuesOptions: const ChartValuesOptions(
              
              showChartValuesInPercentage: true,
              chartValueStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
              showChartValueBackground: false,
            ),
          );
  }
}
