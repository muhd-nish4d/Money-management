part of 'amount_bloc.dart';

abstract class AmountEvent extends Equatable {
  const AmountEvent();

  @override
  List<Object> get props => [];
}

//Initial
class AmountInitialEvent extends AmountEvent {}

//Value Changing
class AmountCalcuteEvent extends AmountEvent {
  final double amuount;
  final CategoryType type;

  const AmountCalcuteEvent({required this.type, required this.amuount});
}

class AmountDeleteEvent extends AmountEvent {
  final double amuount;
  final CategoryType type;

  const AmountDeleteEvent({required this.type, required this.amuount});
}

// class AmountCalcuteEvent extends AmountEvent {
//   final double amuount;
//   final CategoryType type;

//   const AmountCalcuteEvent({required this.type, required this.amuount});
// }
