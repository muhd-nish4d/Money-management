import 'package:flutter/material.dart';
import 'package:tracker/consts/date_parse.dart';
import 'package:tracker/models/category/category_model.dart';

import '../../../consts/color.dart';
import '../../../consts/container_shadow.dart';
import '../../../models/transactions/transactions_model.dart';
import '../../transactions/home_transaction_bottum_sheet.dart';

class WidgetSearchGridResult extends StatelessWidget {
  // final TransactionModel modelObj;
  final List<TransactionModel> newValue;
  final String query;
  const WidgetSearchGridResult(
      {super.key, required this.newValue, required this.query});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              crossAxisCount: 2,
              childAspectRatio: 1.3),
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
              return GestureDetector(
                onTap: () {
                  showHomeBottumSheet(context, transactionObj: value);
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [containerShadow()],
                      gradient: blueGreenGrad,
                      borderRadius: BorderRadius.circular(15)),
                  // color: greyWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            value.type == CategoryType.income
                                ? const Icon(
                                    Icons.arrow_upward,
                                    color: Colors.green,
                                  )
                                : const Icon(
                                    Icons.arrow_downward,
                                    color: Colors.red,
                                  ),
                          ],
                        ),
                        Text(
                          value.category.name,
                          style: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: backBlack),
                        ),
                        Text(value.amount.toString(), style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: backBlack),),
                        Text(parseDate(value.date), style: const TextStyle(
                              // fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: backBlack),)
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return null;
            }
          },
          itemCount: newValue.length,
        ),
      ),
    );
  }
}
