import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/transactions/transactions_bloc.dart';

import '../../models/category/category_model.dart';
part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitialState()) {
    on<FilterDataEvent>((event, emit) async {
      emit(MyLoadingState());
      final filteredData = await filterDataByDate(event.dateRange);
      emit(MyFilteredState(filteredData));
    });
    on<FilterTypeEvent>((event, emit) async {
      emit(MyLoadingState());
      final filteredData = await filterDataByType(event.type);
      emit(MyFilteredState(filteredData));
    });
    on<FilterfFromToEvent>((event, emit) async {
      emit(MyLoadingState());
      final filteredData = await filterByFromTo(event.from, event.end);
      emit(MyFilteredState(filteredData));
    });
  }
  var hlo = transactionfor;

  Future<List<dynamic>> filterByFromTo(DateTime from, DateTime end) async {
    hlo = transactionfor
        .where((element) =>
            element.date.isAfter(from.subtract(const Duration(days: 1))) &&
            element.date.isBefore(end.add(const Duration(days: 1))))
        .toList();
    return hlo;
  }

  Future<List<dynamic>> filterDataByType(CategoryType type) async {
    if (type == CategoryType.income) {
      hlo = transactionfor.where((element) => element.type == type).toList();
      return hlo;
    } else if (type == CategoryType.expense) {
      hlo = transactionfor.where((element) => element.type == type).toList();
      return hlo;
    } else {
      return hlo;
    }
  }

  Future<List<dynamic>> filterDataByDate(String dateRange) async {
    if (dateRange == 'today') {
      hlo = transactionfor
          .where((element) =>
              element.date.day == DateTime.now().day &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList();
      return hlo;
    } else if (dateRange == 'yesterdaty') {
      hlo = transactionfor
          .where((element) =>
              element.date.day == DateTime.now().day - 1 &&
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList();
      return hlo;
    } else if (dateRange == 'lastMonth') {
      hlo = transactionfor
          .where((element) =>
              element.date.month == DateTime.now().month &&
              element.date.year == DateTime.now().year)
          .toList();
      return hlo;
    } else {
      return hlo = transactionfor;
    }
  }
}
