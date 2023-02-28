import 'package:flutter/material.dart';
import 'package:tracker/models/category/category_model.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/widgets/home_transaction_bottum_sheet.dart';

import '../color/color.dart';

class WidgetHomeTransactions extends StatelessWidget {
  final TransactionModel transObj;
  const WidgetHomeTransactions({super.key, required this.transObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        // color: const Color.fromARGB(255, 18, 41, 72),
        // borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 5  horizontally
              10.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(255, 79, 78, 78),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15))),
        onPressed: () {
          showHomeBottumSheet(context, transactionObj: transObj);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(),
                  transObj.type == CategoryType.income
                      ? const Icon(
                          Icons.arrow_upward_rounded,
                          color: darkGreeno,
                        )
                      : const Icon(
                          Icons.arrow_downward_rounded,
                          color: Color.fromARGB(255, 251, 86, 74),
                        )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 32,
              child: Text(
                transObj.category.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: greyWhite),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 32,
              child: Text(transObj.amount.toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: greyWhite,
                      fontFamily: 'Inter')),
            ),
            Text(transObj.date.toString().replaceRange(10, null, ''),
                overflow: TextOverflow.clip,
                style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: greyWhite)),
          ],
        ),
      ),
    );
  }
}

class WidgetEmptyButtonAdd extends StatelessWidget {
  const WidgetEmptyButtonAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        // color: const Color.fromARGB(255, 18, 41, 72),
        // borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 0, 0, 0),
            blurRadius: 15.0, // soften the shadow
            spreadRadius: 2.0, //extend the shadow
            offset: Offset(
              0.0, // Move to right 5  horizontally
              10.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
      child: const Icon(Icons.add),
    );
  }
}
