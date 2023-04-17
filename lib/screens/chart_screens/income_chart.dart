import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:tracker/models/category/category_model.dart';

import '../../blocs/transactions/transactions_bloc.dart';
import '../../consts/color.dart';

class ScreenIncomeChart extends StatefulWidget {
  const ScreenIncomeChart({super.key});

  @override
  State<ScreenIncomeChart> createState() => _ScreenIncomeChartState();
}

class _ScreenIncomeChartState extends State<ScreenIncomeChart> {
  Map<String, double> incomeChartDatas = {};

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionsBloc, TransactionsState>(
      builder: (context, state) {
        if (state is TransactionsShowState) {
          for (var item in state.transactions
              .where((element) => element.type == CategoryType.income)) {
            //If map key is alredy exist the amount add to the key's value
            if (incomeChartDatas.containsKey(item.category.name)) {
              incomeChartDatas[item.category.name] =
                  item.amount + incomeChartDatas[item.category.name]!;
            } else {
              //Create a new key value pair
              incomeChartDatas[item.category.name] = item.amount;
            }
          }
        }
        return incomeChartDatas.isEmpty
            ? const Center(
                child: Text(
                'No Data',
                style: TextStyle(
                    color: greyWhite,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ))
            : PieChart(
                legendOptions: const LegendOptions(
                    legendTextStyle: TextStyle(color: Colors.white)),
                dataMap: incomeChartDatas,
                chartValuesOptions: const ChartValuesOptions(
                  showChartValueBackground: false,
                  chartValueStyle: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              );
      },
    );
    // incomeChartDatas.isEmpty
    //     ? const Center(
    //         child: Text(
    //         'No Data',
    //         style: TextStyle(
    //             color: greyWhite, fontWeight: FontWeight.bold, fontSize: 20),
    //       ))
    //     : PieChart(
    //         legendOptions: const LegendOptions(
    //             legendTextStyle: TextStyle(color: Colors.white)),
    //         dataMap: incomeChartDatas,
    //         chartValuesOptions: const ChartValuesOptions(
    //           showChartValueBackground: false,
    //           chartValueStyle: TextStyle(
    //               fontSize: 15,
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold),
    //         ),
    //       );
  }
}
