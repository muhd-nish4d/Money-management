part of 'amount_bloc.dart';

abstract class AmountState extends Equatable {
  const AmountState();

  @override
  List<Object> get props => [];
}

class AmountInitialState extends AmountState {}

class AmountLoadingState extends AmountState {}

class AmountShowState extends AmountState {
  final double incomeAmount;
  final double expenceAmount;
  final double totalAmount;

  const AmountShowState(
      {required this.totalAmount,
      required this.incomeAmount,
      required this.expenceAmount});
}
