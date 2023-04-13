import 'package:flutter/material.dart';
import '../db_functions/transactions/transaction_db_functions.dart';
import '../models/category/category_model.dart';

class Amounts {
  Amounts._internal();
  static Amounts instance = Amounts._internal();
  factory Amounts() {
    return instance;
  }
  final ValueNotifier<double> incomeResult = ValueNotifier(0.0);
  final ValueNotifier<double> expenseResult = ValueNotifier<double>(0.0);
  final ValueNotifier<double> totalResult = ValueNotifier<double>(0.0);

  double? incomeTotalAmount;
  double? expenseTotalAmount;

  Future<void> totalAmount() async {
    // double incomeTotal = 0;
    incomeResult.value = 0;
    expenseResult.value = 0;
    // double expenseTotal = 0;
    for (var total in TransactionDB.instance.transactionListNotifier.value) {
      if (total.type == CategoryType.income) {
        // }
        incomeResult.value += total.amount;
        // incomeResult.value = incomeTotal;
      } else {
        expenseResult.value += total.amount;
        // expenseResult.value = expenseTotal;
      }
    }
    totalResult.value = incomeResult.value - expenseResult.value;
  }
}
