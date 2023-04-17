import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/filter/filter_bloc.dart';
import 'package:tracker/consts/color.dart';
import '../../models/category/category_model.dart';
import '../../models/transactions/transactions_model.dart';
import '../../widgets/search/date_rangefilter_date_picker.dart';
import '../../widgets/search/search_result/search_result.dart';

class ScreenSearch extends SearchDelegate {
  List<TransactionModel>? filterItems;
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(appBarTheme: const AppBarTheme(color: gradBlue));
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
            BlocProvider.of<FilterBloc>(context)
                .add(const FilterDataEvent('all'));
          },
          icon: const Icon(Icons.clear)),
      PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: const Icon(Icons.calendar_month_rounded),
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () async {
                BlocProvider.of<FilterBloc>(context)
                    .add(const FilterDataEvent('all'));
                //==================================After Bloc=========================================
                // await TransactionDB.instance.refreshTransUI();
                //==================================After Bloc=========================================
                // selectedValueDate = DateTime.now();
              },
              child: const Text('All')),
          PopupMenuItem(
              onTap: () async {
                BlocProvider.of<FilterBloc>(context)
                    .add(const FilterDataEvent('today'));
                //==================================After Bloc=========================================
                // await TransactionDB.instance.refreshTransUI();
                // filterListener.value = TransactionDB
                //     .instance.transactionListNotifier.value
                //     .where((element) =>
                //         element.date.day == DateTime.now().day &&
                //         element.date.month == DateTime.now().month &&
                //         element.date.year == DateTime.now().year)
                //     .toList();
                //==================================After Bloc=========================================
                // selectedValueDate = DateTime.now();
              },
              child: const Text('Today')),
          PopupMenuItem(
              onTap: () async {
                // ==================================After Bloc=========================================

                // await TransactionDB.instance.refreshTransUI();
                // filterListener.value =

                // BlocBuilder<TransactionsBloc, TransactionsState>(
                //   builder: (context, state) {
                //     if (state is TransactionsShowState) {
                //       filterItems = state.transactions
                //           .where((element) =>
                //               element.date.day == DateTime.now().day - 1 &&
                //               element.date.month == DateTime.now().month &&
                //               element.date.year == DateTime.now().year)
                //           .toList();
                //     }
                //     return Container();
                //   },
                // );
                BlocProvider.of<FilterBloc>(context)
                    .add(const FilterDataEvent('yesterdaty'));

                // TransactionDB
                //     .instance.transactionListNotifier.value
                //     .where((element) =>
                //         element.date.day == DateTime.now().day - 1 &&
                //         element.date.month == DateTime.now().month &&
                //         element.date.year == DateTime.now().year)
                //     .toList();
                //==================================After Bloc=========================================
                // selectedValue = DateTime.now();
              },
              child: const Text('Yesterday')),
          PopupMenuItem(
              onTap: () async {
                BlocProvider.of<FilterBloc>(context)
                    .add(const FilterDataEvent('lastMonth'));
                //==================================After Bloc=========================================
                // await TransactionDB.instance.refreshTransUI();
                // filterListener.value = TransactionDB
                //     .instance.transactionListNotifier.value
                //     .where((element) =>
                //         element.date.month == DateTime.now().month &&
                //         element.date.year == DateTime.now().year)
                //     .toList();
                //==================================After Bloc=========================================
              },
              child: const Text('Month')),
          // PopupMenuItem(
          //     onTap: () async {
          //       await TransactionDB.instance.refreshTransUI();
          //       filterListener.value = TransactionDB
          //           .instance.transactionFilterNotifier.value
          //           .where((element) =>
          //               element.date.day <= selectedDateFirst.day &&
          //               element.date.month <= selectedDateFirst.month &&
          //               element.date.year <= selectedDateFirst.year &&
          //               element.date.day >= selectedDateLast.day &&
          //               element.date.month >= selectedDateLast.month &&
          //               element.date.year >= selectedDateLast.year)
          //           .toList();
          //           print(selectedDateFirst);
          //           print(selectedDateLast);
          //     },
          //     child: const WidgetPopupMenuDatePick())
          PopupMenuItem(
            onTap: () async {
              if (first == null || second == null) {
                return;
              } else {
                BlocProvider.of<FilterBloc>(context)
                    .add(FilterfFromToEvent(from: first!, end: second!));
                //==================================Aft
                //==================================After Bloc=========================================
                // await TransactionDB.instance.refreshTransUI();
                // filterListener.value = TransactionDB
                // .instance.transactionFilterNotifier.value
                // .where((element) =>
                //     element.date.isAfter(
                //         first!.subtract(const Duration(days: 1))) &&
                //     element.date
                //         .isBefore(second!.add(const Duration(days: 1))))
                // .toList();
                //==================================After Bloc=========================================
              }
            },
            child: const WidgetDateRangePicker(),
          )
        ],
      ),
      PopupMenuButton(
        // child: Icon(Icons.abc),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: const Icon(Icons.all_inbox_rounded),
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () async {
                BlocProvider.of<FilterBloc>(context)
                    .add(const FilterDataEvent('all'));
                //==================================After Bloc=========================================
                // await TransactionDB.instance.refreshTransUI();
                // filterListener = TransactionDB.instance.transactionListNotifier;
                //==================================After Bloc=========================================
              },
              child: const Text('All')),
          PopupMenuItem(
              onTap: () async {
                BlocProvider.of<FilterBloc>(context)
                    .add(const FilterTypeEvent(CategoryType.income));
                //==================================After Bloc=========================================
                // await TransactionDB.instance.refreshTransUI();
                // filterListener.value = TransactionDB
                //     .instance.transactionListNotifier.value
                //     .where((element) => element.type == CategoryType.income)
                //     .toList();
                //==================================After Bloc=========================================
                // selectedValueType = CategoryType.income;
              },
              child: const Text('Income')),
          PopupMenuItem(
              onTap: () async {
                BlocProvider.of<FilterBloc>(context)
                    .add(const FilterTypeEvent(CategoryType.expense));
                //==================================After Bloc=========================================
                // await TransactionDB.instance.refreshTransUI();
                // filterListener.value = TransactionDB
                //     .instance.transactionListNotifier.value
                //     .where((element) => element.type == CategoryType.expense)
                //     .toList();
                //==================================After Bloc=========================================
                // selectedValueType = CategoryType.expense;
              },
              child: const Text('Expense')),
        ],
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          //==================================After Bloc=========================================
          // TransactionDB.instance.refreshTransUI();
          //==================================After Bloc=========================================
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return WidgerSearchResult(
      query: query,
      filter: filterItems ?? [],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return WidgerSearchResult(
      query: query,
      filter: filterItems ?? [],
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, F41, 72)
//font = Inter