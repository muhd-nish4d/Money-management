import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../consts/color.dart';
import '../../../consts/delete_popup.dart';
import '../../../models/transactions/transactions_model.dart';
import '../../../problems/amount_totals.dart';
import '../../../screens/transactions/edit_screen.dart';
import '../search_screen_cards.dart';

class WidgetSearchListResult extends StatelessWidget {
  final List<TransactionModel> newValue;
  final String query;
  const WidgetSearchListResult({super.key, required this.newValue, required this.query});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          final value = newValue[index];
          if (value.category.name
                  .toLowerCase()
                  .contains(query.toLowerCase().trim()) ||
              value.amount
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase().trim()) ||
              value.note
                  .toString()
                  .toLowerCase()
                  .contains(query.toLowerCase().trim())) {
            return Slidable(
              startActionPane:
                  ActionPane(motion: const StretchMotion(), children: [
                SlidableAction(
                  onPressed: (ctx) async {
                    alertMassege(context, id: value.id.toString());
                    Amounts().totalAmount();
                  },
                  backgroundColor: backBlack,
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
                  backgroundColor: backBlack,
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
          }
          return null;
        },
        itemCount: newValue.length,
      ),
    );
  }
}
