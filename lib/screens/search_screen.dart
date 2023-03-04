import 'package:flutter/material.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tracker/models/category/category_model.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/problems/amount_totals.dart';
import 'package:tracker/screens/edit_screen.dart';
import 'package:tracker/widgets/toast.dart';
import '../widgets/search_screen_cards.dart';

var filterListener = TransactionDB.instance.transactionFilterNotifier;
// var selectedValueType = ;
// var selectedValueDate;

class ScreenSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear)),
      PopupMenuButton(
        icon: const Icon(Icons.calendar_month_rounded),
        itemBuilder: (context) => [
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
              child: Text('Yesterday')),
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
              child: Text('Month')),
        ],
      ),
      PopupMenuButton(
        // child: Icon(Icons.abc),
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
    return ValueListenableBuilder(
      valueListenable: filterListener,
      builder: (context, newValue, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final value = newValue[index];
            if (value.category.name
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                value.amount
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase().trim())) {
              return Slidable(
                startActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    onPressed: (ctx) {
                      TransactionDB.instance
                          .deleteTransactions(value.id.toString());
                      showToast(message: 'Deleted');
                    },
                    borderRadius: BorderRadius.circular(15),
                    foregroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (ctx) {
                      final TransactionModel transmodel = TransactionModel(
                          id: value.id,
                          amount: value.amount,
                          date: value.date,
                          note: value.note,
                          type: value.type,
                          category: value.category);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ScreenEdit(transobj: transmodel)));
                    },
                    borderRadius: BorderRadius.circular(15),
                    foregroundColor: Colors.blue,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ]),
                key: Key(value.id!),
                child: WidgetSearchCards(
                  modelObj: value,
                  icon: value.type.index == 0
                      ? const Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        ),
                ),
              );
            } else {
              return Container();
            }
          },
          itemCount: newValue.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: filterListener,
      builder: (context, newValue, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final value = newValue[index];
            if (value.category.name
                    .toLowerCase()
                    .contains(query.toLowerCase().trim()) ||
                value.amount
                    .toString()
                    .toLowerCase()
                    .contains(query.toLowerCase().trim())) {
              return Slidable(
                startActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    onPressed: (ctx) async {
                      await TransactionDB.instance
                          .deleteTransactions(value.id.toString());
                      Amounts().totalAmount();
                    },
                    borderRadius: BorderRadius.circular(15),
                    foregroundColor: Colors.red,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (ctx) {
                      final TransactionModel transmodel = TransactionModel(
                          id: value.id,
                          amount: value.amount,
                          date: value.date,
                          note: value.note,
                          type: value.type,
                          category: value.category);

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (ctx) => ScreenEdit(transobj: transmodel)));
                    },
                    borderRadius: BorderRadius.circular(15),
                    foregroundColor: Colors.blue,
                    icon: Icons.edit,
                    label: 'Edit',
                  ),
                ]),
                key: Key(value.id!),
                child: WidgetSearchCards(
                  modelObj: value,
                  icon: value.type.index == 0
                      ? const Icon(
                          Icons.arrow_upward,
                          color: Colors.green,
                        )
                      : const Icon(
                          Icons.arrow_downward,
                          color: Colors.red,
                        ),
                ),
              );
            } else {
              return Container();
            }
          },
          itemCount: newValue.length,
        );
      },
    );
  }
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, F41, 72)
//font = Inter