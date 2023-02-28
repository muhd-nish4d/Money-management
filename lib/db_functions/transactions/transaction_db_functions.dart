import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tracker/models/transactions/transactions_model.dart';

const transactionDBName = 'transactionsDB';
abstract class TransacrionDBFunctions {
  Future<void> transactionAdd(TransactionModel obj);
  Future<List<TransactionModel>> getTransactions();
  Future<void> deleteTransactions(String transId);
  Future<void> editTransactionDb(TransactionModel obj);
}

class TransactionDB implements TransacrionDBFunctions {
  TransactionDB._internal();
  static TransactionDB instance = TransactionDB._internal();
  factory TransactionDB(){
    return instance;
  }

  ValueNotifier<List<TransactionModel>> transactionListNotifier = ValueNotifier([]);

  @override
  Future<void> transactionAdd(TransactionModel obj) async {
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
    await transactionDB.put(obj.id, obj);

  }
  
  @override
  Future<List<TransactionModel>> getTransactions() async{
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
    return transactionDB.values.toList();
  }

  Future<void>refreshTransUI() async{
    final transList = await getTransactions();
    transList.sort((first, second) => second.date.compareTo(first.date));
    transactionListNotifier.value.clear();
    transactionListNotifier.value.addAll(transList);
    transactionListNotifier.notifyListeners();
  }
  
  @override
  Future<void> deleteTransactions(String transId) async{
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.delete(transId);
    refreshTransUI();
  }
  
  @override
  Future<void> editTransactionDb(TransactionModel obj) async{
    final transactionDB = await Hive.openBox<TransactionModel>(transactionDBName);
    transactionDB.put(obj.id, obj);
  }
}