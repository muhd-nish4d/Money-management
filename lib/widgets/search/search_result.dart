import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/consts/delete_popup.dart';
import 'package:tracker/widgets/search/search_screen_cards.dart';
import '../../models/transactions/transactions_model.dart';
import '../../problems/amount_totals.dart';
import '../../screens/search/search_screen.dart';
import '../../screens/transactions/edit_screen.dart';

class WidgerSearchResult extends StatelessWidget {
  final String query;
  const WidgerSearchResult({
    super.key,
    required this.query,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: backBlack,
      child: ValueListenableBuilder(
        valueListenable: filterListener,
        builder: (context, newValue, child) {
          return filterListener.value.isEmpty
              ? const Center(
                  child: Text(
                    'No data',
                    style: TextStyle(
                        color: greyWhite,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                )
              : ListView.builder(
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
                        startActionPane: ActionPane(
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (ctx) async {
                                  alertMassege(context,
                                      id: value.id.toString());
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
                                  final TransactionModel transmodel =
                                      TransactionModel(
                                          id: value.id,
                                          amount: value.amount,
                                          date: value.date,
                                          note: value.note,
                                          type: value.type,
                                          category: value.category);

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) =>
                                          ScreenEdit(transobj: transmodel)));
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
                    } else {
                      return Container();
                    }
                  },
                  itemCount: newValue.length,
                );
        },
      ),
    );
  }
}
