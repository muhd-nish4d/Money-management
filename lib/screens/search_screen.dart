import 'package:flutter/material.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/screens/edit_screen.dart';
import 'package:tracker/widgets/toast.dart';
import '../widgets/search_screen_cards.dart';

class ScreenSearch extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TransactionDB.instance.transactionListNotifier,
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
      valueListenable: TransactionDB.instance.transactionListNotifier,
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