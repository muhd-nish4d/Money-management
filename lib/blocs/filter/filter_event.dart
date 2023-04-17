part of 'filter_bloc.dart';

abstract class FilterEvent extends Equatable {
  const FilterEvent();

  @override
  List<Object> get props => [];
}

class FilterDataEvent extends FilterEvent {
  final String dateRange;

  const FilterDataEvent(this.dateRange);
}

class FilterTypeEvent extends FilterEvent {
  final CategoryType type;

  const FilterTypeEvent(this.type);
}

class FilterfFromToEvent extends FilterEvent {
  final DateTime from;
  final DateTime end;

  const FilterfFromToEvent({required this.from, required this.end});
}
