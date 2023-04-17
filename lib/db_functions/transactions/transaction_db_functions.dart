// import 'package:flutter/foundation.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:tracker/models/transactions/transactions_model.dart';
// import 'package:tracker/problems/amount_totals.dart';

// const transactionDBName = 'transactionsDB';
// abstract class TransacrionDBFunctions {
//   Future<void> transactionAdd(TransactionModel obj);
//   Future<List<TransactionModel>> getTransactions();
//   Future<void> deleteTransactions(String transId);
//   Future<void> editTransactionDb(TransactionModel obj);
//   Future<void> transactionClear();
// }

// class TransactionDB implements TransacrionDBFunctions {
//   TransactionDB._internal();
//   static TransactionDB instance = TransactionDB._internal();
//   factory TransactionDB(){
//     return instance;
//   }

//   ValueNotifier<List<TransactionModel>> transactionListNotifier = ValueNotifier([]);
//   ValueNotifier<List<TransactionModel>> transactionFilterNotifier = ValueNotifier([]);

//   @override
//   Future<void> transactionAdd(TransactionModel obj) async {
//     final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
//     await transactionDB.put(obj.id, obj);

//   }

//   @override
//   Future<List<TransactionModel>> getTransactions() async{
//     final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
//     return transactionDB.values.toList();
//   }

//   Future<void>refreshTransUI() async{
//     final transList = await getTransactions();
//     transList.sort((first, second) => second.date.compareTo(first.date));
//     transactionListNotifier.value.clear();
//     transactionFilterNotifier.value.clear();
//     transactionListNotifier.value.addAll(transList);
//     transactionFilterNotifier.value.addAll(transList);
//     Amounts.instance. totalAmount();
//     transactionListNotifier.notifyListeners();
//     transactionFilterNotifier.notifyListeners();
//   }

//   @override
//   Future<void> deleteTransactions(String transId) async{
//     final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
//     transactionDB.delete(transId);
//     refreshTransUI();
//   }

//   @override
//   Future<void> editTransactionDb(TransactionModel obj) async{
//     final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
//     transactionDB.put(obj.id, obj);
//   }

//   @override
//   Future<void> transactionClear()async {
//     final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
//     await transactionDB.clear();
//     refreshTransUI();
//   }
// }

import 'package:hive/hive.dart';

import '../../models/transactions/transactions_model.dart';

class TransactionsDBFunctions {
  final transactionsDBName = 'transactionsDB';

  //open box
  Future<Box<TransactionModel>> transactionsOpenBox() async {
    var box = await Hive.openBox<TransactionModel>(transactionsDBName);
    return box;
  }

  //Get Transactions
  Future<List<TransactionModel>> getAllTransactions() async {
    final box = await transactionsOpenBox();
    List<TransactionModel> transactions = box.values.toList();
    return transactions;
  }

  //Add Transactions
  Future<void> addTransactions(TransactionModel transaction) async {
    final box = await transactionsOpenBox();
    await box.put(transaction.id, transaction);
  }

  //Delete Transactions
  Future<void> deleteTransacions(String id) async {
    final box = await transactionsOpenBox();
    await box.delete(id);
  }

  //Update Transactions
  Future<void> updateTransactions(TransactionModel transaction) async {
    final box = await transactionsOpenBox();
    await box.put(transaction.id, transaction);
  }

  //Clear Transactions
  Future<void> clearTransactions() async {
    final box = await transactionsOpenBox();
    await box.clear();
  }
}
