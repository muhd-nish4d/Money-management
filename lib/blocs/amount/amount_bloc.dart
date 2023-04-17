import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../db_functions/transactions/transaction_db_functions.dart';
import '../../models/category/category_model.dart';

part 'amount_event.dart';
part 'amount_state.dart';

class AmountBloc extends Bloc<AmountEvent, AmountState> {
  final TransactionsDBFunctions transactionsDBFuninTotal;
  double totalAmount = 0;
  double incomeAmount = 0;
  double expenseAmount = 0;
  AmountBloc(this.transactionsDBFuninTotal) : super(AmountInitialState()) {
    on<AmountInitialEvent>((event, emit) async {
      emit(AmountLoadingState());
      await _calculateAll();
      log(totalAmount.toString());
      log(incomeAmount.toString());
      log(expenseAmount.toString());
      emit(AmountShowState(
          totalAmount: totalAmount,
          incomeAmount: incomeAmount,
          expenceAmount: expenseAmount));
    });
    on<AmountCalcuteEvent>((event, emit) async {
      emit(AmountLoadingState());
      await _addNewOne(amount: event.amuount, type: event.type);
      log(totalAmount.toString());
      log(incomeAmount.toString());
      log(expenseAmount.toString());
      emit(AmountShowState(
          totalAmount: totalAmount,
          incomeAmount: incomeAmount,
          expenceAmount: expenseAmount));
    });
  }

  //Helping Functions
  Future<void> _calculateAll() async {
    await transactionsDBFuninTotal.getAllTransactions().then((value) {
      incomeAmount = 0;
      totalAmount = 0;
      expenseAmount = 0;
      for (var element in value) {
        if (element.type == CategoryType.income) {
          // }
          incomeAmount += element.amount;
          // incomeResult.value = incomeTotal;
        } else {
          expenseAmount += element.amount;
          // expenseResult.value = expenseTotal;
        }
      }
      totalAmount = incomeAmount - expenseAmount;
    });
    // log('income ${incomeAmount.toString()}');
    // log('expense ${expenseAmount.toString()}');
    // log('total ${totalAmount.toString()}');
  }

  Future<void> _addNewOne(
      {required double amount, required CategoryType type}) async {
    if (type == CategoryType.income) {
      incomeAmount += amount;
    } else {
      expenseAmount += amount;
    }
    totalAmount = incomeAmount - expenseAmount;
    // log('income ${incomeAmount.toString()}');
    // log('expense ${expenseAmount.toString()}');
    // log('total ${totalAmount.toString()}');
  }
}
