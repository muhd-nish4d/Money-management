import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/consts/container_shadow.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/widgets/transactions/home_transaction_bottum_sheet.dart';

import '../../consts/date_parse.dart';

class WidgetSearchCards extends StatelessWidget {
  final TransactionModel modelObj;
  final Icon icon;
  const WidgetSearchCards(
      {super.key,
      required this.modelObj, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [containerShadow()],
          gradient: blueGreenGrad,
          borderRadius: BorderRadius.circular(15)
        ),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListTile(
            onTap: () {
              showHomeBottumSheet(context, transactionObj: modelObj);
            },
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 200,
                    child: Text(
                      overflow: TextOverflow.ellipsis,
                      modelObj.category.name,
                      style: const TextStyle(
                          color: backBlack,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    parseDate(modelObj.date),
                    // modelObj.date.toString().replaceRange(10, null, ''),
                    style: const TextStyle(color: backBlack, fontSize: 13,fontWeight: FontWeight.bold),
                  )
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                  "₹${modelObj.amount}",
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      color: backBlack,
                      fontSize: 28,
                      fontWeight: FontWeight.bold),
                ),
                icon
                ],
              ),
              ),
        ),
      ),
    );
  }
}
