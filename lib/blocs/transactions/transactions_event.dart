part of 'transactions_bloc.dart';

abstract class TransactionsEvent extends Equatable {
  const TransactionsEvent();

  @override
  List<Object> get props => [];
}

//initial Event
class TransactionsInitialEvent extends TransactionsEvent {}

//Add Event
class TransactionAddEvent extends TransactionsEvent {
  final String id;
  final double amount;
  final DateTime dateTime;
  final String note;
  final CategoryType type;
  final CategoryModel category;

  const TransactionAddEvent(
      {required this.id,
      required this.amount,
      required this.dateTime,
      required this.note,
      required this.type,
      required this.category});
}

//Edit Event
class TransactionEditEvent extends TransactionsEvent {
  final String id;
  final double amount;
  final DateTime dateTime;
  final String note;
  final CategoryType type;
  final CategoryModel category;

  const TransactionEditEvent(
      {required this.id,
      required this.amount,
      required this.dateTime,
      required this.note,
      required this.type,
      required this.category});
}

//Delete Event
class TransctionsDeleteEvent extends TransactionsEvent {
  final String id;

  const TransctionsDeleteEvent({required this.id});
}
