import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';
import 'package:tracker/models/transactions/transactions_model.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsDBFunctions transactionsDBFun;
  List<TransactionModel> transactons = [];
  TransactionsBloc(this.transactionsDBFun) : super(TransactionsInitialState()) {
    on<TransactionsInitialEvent>((event, emit) {
      emit(TransactionsLodingState());
    });
  }

  //Helping functions
  Future<void> _getTransactions() async {
    await transactionsDBFun
        .getAllTransactions()
        .then((value) => transactons = value);
  }

  Future<void> _addTransactions({
    required String id,
    required String note,
    required double amount,
    required DateTime date,
    required CategoryType type,
    required CategoryModel category,
  }) async {
    await transactionsDBFun.addTransactions(TransactionModel(
        id: id,
        amount: amount,
        date: date,
        note: note,
        type: type,
        category: category));
  }

  Future<void> _editTransactions({
    required String id,
    required double amount,
    required DateTime date,
    required String note,
    required CategoryType type,
    required CategoryModel category,
  }) async {
    await transactionsDBFun.updateTransactions(TransactionModel(
        id: id,
        amount: amount,
        date: date,
        note: note,
        type: type,
        category: category));
  }

  Future<void> _deleteTransactions({required String id}) async {
    await transactionsDBFun.deleteTransacions(id);
  }
}
