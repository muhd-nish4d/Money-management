import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';

import '../../blocs/transactions/transactions_bloc.dart';
import '../../consts/color.dart';

class ScreenExpenseChart extends StatefulWidget {
  const ScreenExpenseChart({super.key});

  @override
  State<ScreenExpenseChart> createState() => _ScreenExpenseChartState();
}

class _ScreenExpenseChartState extends State<ScreenExpenseChart> {
  Map<String, double> expenseChartData = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsShowState) {
          for (var item in state.transactions
              .where((element) => element.type == CategoryType.expense)) {
            //If map key is alredy exist the amount add to the key's value
            if (expenseChartData.containsKey(item.category.name)) {
              expenseChartData[item.category.name] =
                  item.amount + expenseChartData[item.category.name]!;
            } else {
              //Create a new key value pair
              expenseChartData[item.category.name] = item.amount;
            }
          }
          return expenseChartData.isEmpty
              ? const Center(
                  child: Text(
                  'No Data',
                  style: TextStyle(
                      color: greyWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))
              : PieChart(
                  // centerTextStyle: TextStyle(color: Colors.white),
                  // animationDuration: Duration(seconds: 1),
                  dataMap: expenseChartData,
                  legendOptions: const LegendOptions(
                      legendTextStyle: TextStyle(color: Colors.white)),

                  chartValuesOptions: const ChartValuesOptions(
                    // showChartValuesInPercentage: true,
                    chartValueStyle: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                    showChartValueBackground: false,
                  ),
                );
        }
        return Container();
      },
    );

    // expenseChartData.isEmpty
    //     ? const Center(
    //         child: Text(
    //         'No Data',
    //         style: TextStyle(
    //             color: greyWhite, fontWeight: FontWeight.bold, fontSize: 20),
    //       ))
    //     :
    // PieChart(
    //         // centerTextStyle: TextStyle(color: Colors.white),
    //         // animationDuration: Duration(seconds: 1),
    //         dataMap: expenseChartData,
    //         legendOptions: const LegendOptions(
    //             legendTextStyle: TextStyle(color: Colors.white)),

    //         chartValuesOptions: const ChartValuesOptions(
    //           // showChartValuesInPercentage: true,
    //           chartValueStyle: TextStyle(
    //               fontSize: 15,
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold),
    //           showChartValueBackground: false,
    //         ),
    //       );
  }
}
