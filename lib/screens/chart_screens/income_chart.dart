import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';
import 'package:tracker/screens/chart_screens/full_chart.dart';

class ScreenIncomeChart extends StatefulWidget {
  const ScreenIncomeChart({super.key});

  @override
  State<ScreenIncomeChart> createState() => _ScreenIncomeChartState();
}

class _ScreenIncomeChartState extends State<ScreenIncomeChart> {
  // Map<String, double>? incomeVata;
  Map<String, double> incomeChartDatas = {'': 0};

  // TransactionDB.instance.transactionListNotifier.value.map((e) {
  //     return Map<String, double> newMap = {

  //     };
  //   });

  void incomeSetup() {
    incomeChartDatas.clear();
    for (var item in TransactionDB.instance.transactionListNotifier.value
        .where((element) => element.type == CategoryType.income)) {
      Map<String, double> datas = {item.category.name: item.amount};
      incomeChartDatas.addAll(datas);
      // incomeVata = shahid;
    }
  }

  // ValueNotifier<List<TransactionModel>> incomeNotifier =
  //     ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

  // Map<String, double> incomeChart = {incomeNotifier.};
  @override
  Widget build(BuildContext context) {
    incomeSetup();
    return

        // var nishadk = value.where((element) => element.type == CategoryType.income).toList();

        incomeChartDatas.isEmpty
            ? const Text('No Data')
            : PieChart(
                // centerTextStyle: TextStyle(color: Colors.white),
                // animationDuration: Duration(seconds: 1),

                dataMap: incomeChartDatas,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: false,
                  showChartValuesInPercentage: true,
                  chartValueStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              );
  }
}
