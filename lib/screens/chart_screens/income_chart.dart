// import 'package:flutter/material.dart';
// import 'package:pie_chart/pie_chart.dart';
// import 'package:tracker/consts/color.dart';
// import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
// import 'package:tracker/models/category/category_model.dart';

// class ScreenIncomeChart extends StatefulWidget {
//   const ScreenIncomeChart({super.key});

//   @override
//   State<ScreenIncomeChart> createState() => _ScreenIncomeChartState();
// }

// class _ScreenIncomeChartState extends State<ScreenIncomeChart> {
//   Map<String, double> incomeChartDatas = {};

//   void incomeSetup() {
//     for (var item in TransactionDB.instance.transactionListNotifier.value
//         .where((element) => element.type == CategoryType.income)) {
//       //If map key is alredy exist the amount add to the key's value
//       if (incomeChartDatas.containsKey(item.category.name)) {
//         incomeChartDatas[item.category.name] =
//             item.amount + incomeChartDatas[item.category.name]!;
//       } else {
//         //Create a new key value pair
//         incomeChartDatas[item.category.name] = item.amount;
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     incomeSetup();
//     return incomeChartDatas.isEmpty
//         ? const Center(
//             child: Text(
//             'No Data',
//             style: TextStyle(
//                 color: greyWhite, fontWeight: FontWeight.bold, fontSize: 20),
//           ))
//         : PieChart(
//             legendOptions: const LegendOptions(
//                 legendTextStyle: TextStyle(color: Colors.white)),
//             dataMap: incomeChartDatas,
//             chartValuesOptions: const ChartValuesOptions(
//               showChartValueBackground: false,
//               chartValueStyle: TextStyle(
//                   fontSize: 15,
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold),
//             ),
//           );
//   }
// }
