part of 'filter_bloc.dart';

abstract class FilterState extends Equatable {
  const FilterState();

  @override
  List<Object> get props => [];
}

class FilterInitialState extends FilterState {}

class MyLoadingState extends FilterState {}

class MyFilteredState extends FilterState {
  final List<dynamic> data;

  const MyFilteredState(this.data);
}

class MyErrorState extends FilterState {
  final String message;

  const MyErrorState(this.message);
}
