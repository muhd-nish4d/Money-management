import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/amount/amount_bloc.dart';
import 'package:tracker/blocs/transactions/transactions_bloc.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/screens/home/home_screen.dart';

import '../../blocs/category/category_bloc.dart';
class ScreenSplash extends StatefulWidget {
  const ScreenSplash({super.key});

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 7),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const ScreenHome())));
  }

  @override
  Widget build(BuildContext context) {
    //after bloc
    BlocProvider.of<CategoryBloc>(context).add(CategoryInitialEvent());
    // CategoryDB.instance.refreshUI();
    BlocProvider.of<TransactionsBloc>(context).add(TransactionsInitialEvent());
    BlocProvider.of<AmountBloc>(context).add(AmountInitialEvent());
    // TransactionDB.instance.refreshTransUI();
    // Amounts.instance.totalAmount();
    // return Scaffold(
    //   body: Center(
    //     child: Text('data',style: TextStyle(color: Colors.amber),),
    //   ),
    // );
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(color: backBlack
          // gradient: blueGreenGrad
          ),
      child: Center(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: TextLiquidFill(
            text: 'MoneyMate',
            waveColor: greyWhite,
            boxBackgroundColor: backBlack,
            textStyle: const TextStyle(
                fontSize: 30.0,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none),
            boxHeight: 100.0,

            // boxWidth: 230,
          ),
        ),
      ),
    );
  }
}
