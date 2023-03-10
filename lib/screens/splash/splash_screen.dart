import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';

import 'package:tracker/screens/home/home_screen.dart';

import '../../db_functions/transactions/transaction_db_functions.dart';

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
        const Duration(seconds: 3),
        () => Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const ScreenHome())));
  }

  @override
  Widget build(BuildContext context) {
    CategoryDB.instance.refreshUI();
    TransactionDB.instance.refreshTransUI();
    // Amounts.instance.totalAmount();
    // return Scaffold(
    //   body: Center(
    //     child: Text('data',style: TextStyle(color: Colors.amber),),
    //   ),
    // );
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(gradient: blueGreenGrad),
      child: const Center(
        child: Text('Money Tracker',
            style: TextStyle(
                decoration: TextDecoration.none,
                color: backBlack,
                fontSize: 30,
                fontFamily: 'Inter')),
      ),
    );
  }
}
