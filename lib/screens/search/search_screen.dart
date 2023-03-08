import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';
import '../../widgets/search/popupmenu_datepicker.dart';
import '../../widgets/search/search_result.dart';

var filterListener = TransactionDB.instance.transactionFilterNotifier;
// var selectedValueType = ;
// var selectedValueDate;

class ScreenSearch extends SearchDelegate {
  // final DateTime selectedDateFirst = firstSelctedDate ??= DateTime.now();
  // final DateTime selectedDateLast =
  //     lastSelectedDate ??= DateTime.now().subtract(const Duration(days: 10));
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
          },
          icon: const Icon(Icons.clear)),
      PopupMenuButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: const Icon(Icons.calendar_month_rounded),
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () async {
                await TransactionDB.instance.refreshTransUI();
                // selectedValueDate = DateTime.now();
              },
              child: const Text('All')),
          PopupMenuItem(
              onTap: () async {
                await TransactionDB.instance.refreshTransUI();
                filterListener.value = TransactionDB
                    .instance.transactionListNotifier.value
                    .where((element) =>
                        element.date.day == DateTime.now().day &&
                        element.date.month == DateTime.now().month &&
                        element.date.year == DateTime.now().year)
                    .toList();
                // selectedValueDate = DateTime.now();
              },
              child: const Text('Today')),
          PopupMenuItem(
              onTap: () async {
                await TransactionDB.instance.refreshTransUI();
                filterListener.value = TransactionDB
                    .instance.transactionListNotifier.value
                    .where((element) =>
                        element.date.day == DateTime.now().day - 1 &&
                        element.date.month == DateTime.now().month &&
                        element.date.year == DateTime.now().year)
                    .toList();
                // selectedValue = DateTime.now();
              },
              child: const Text('Yesterday')),
          PopupMenuItem(
              onTap: () async {
                await TransactionDB.instance.refreshTransUI();
                filterListener.value = TransactionDB
                    .instance.transactionListNotifier.value
                    .where((element) =>
                        element.date.month == DateTime.now().month &&
                        element.date.year == DateTime.now().year)
                    .toList();
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
        ],
      ),
      PopupMenuButton(
        // child: Icon(Icons.abc),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        icon: const Icon(Icons.all_inbox_rounded),
        itemBuilder: (context) => [
          PopupMenuItem(
              onTap: () async {
                await TransactionDB.instance.refreshTransUI();
                filterListener = TransactionDB.instance.transactionListNotifier;
              },
              child: const Text('All')),
          PopupMenuItem(
              onTap: () async {
                await TransactionDB.instance.refreshTransUI();
                filterListener.value = TransactionDB
                    .instance.transactionListNotifier.value
                    .where((element) => element.type == CategoryType.income)
                    .toList();
                // selectedValueType = CategoryType.income;
              },
              child: const Text('Income')),
          PopupMenuItem(
              onTap: () async {
                await TransactionDB.instance.refreshTransUI();
                filterListener.value = TransactionDB
                    .instance.transactionListNotifier.value
                    .where((element) => element.type == CategoryType.expense)
                    .toList();
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
          TransactionDB.instance.refreshTransUI();
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return WidgerSearchResult(query: query);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return WidgerSearchResult(query: query);
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, F41, 72)
//font = Inter