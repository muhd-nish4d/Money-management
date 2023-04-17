import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pie_chart/pie_chart.dart';
import '../../blocs/amount/amount_bloc.dart';
import '../../consts/color.dart';

// ValueNotifier<List<TransactionModel>> chartNotifier =
//     ValueNotifier(TransactionDB.instance.transactionListNotifier.value);

class ScreenFullChart extends StatelessWidget {
  const ScreenFullChart({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, double> totalmappp = {};
    double total = 0;
    return BlocBuilder<AmountBloc, AmountState>(
      builder: (context, state) {
        if (state is AmountLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is AmountShowState) {
          total = state.incomeAmount + state.expenceAmount;
          Map<String, double> totalBlocMap = {
            'Income': state.incomeAmount,
            'Expense': state.expenceAmount,
          };
          totalmappp = totalBlocMap;
          return total == 0
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
                  dataMap: totalmappp,
                );
        } else {
          return Container();
        }
      },
    );
    // var total = Amounts.instance.incomeResult.value +
    //     Amounts.instance.expenseResult.value;
    // Map<String, double> totalmappp = {
    //   'Income': Amounts.instance.incomeResult.value,
    //   'Expense': Amounts.instance.expenseResult.value,
    // };

    // total == 0
    //     ?
    //     const Center(
    //         child: Text(
    //   'No Data',
    //   style: TextStyle(
    //       color: greyWhite, fontWeight: FontWeight.bold, fontSize: 20),
    // ));
    //     PieChart(
    //   legendOptions:
    //       const LegendOptions(legendTextStyle: TextStyle(color: Colors.white)),
    //   dataMap: totalmappp,
    // );
  }

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
