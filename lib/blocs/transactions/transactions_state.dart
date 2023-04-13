part of 'transactions_bloc.dart';

abstract class TransactionsState extends Equatable {
  const TransactionsState();

  @override
  List<Object> get props => [];
}

class TransactionsInitialState extends TransactionsState {}

class TransactionsLodingState extends TransactionsState {}

class TransactionsEditState extends TransactionsState {
  final List<TransactionModel> transactions;

  const TransactionsEditState({required this.transactions});
}

class TransactionsShowState extends TransactionsState {
  final List<TransactionModel> transactions;

  const TransactionsShowState({required this.transactions});
}
