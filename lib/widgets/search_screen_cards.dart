import 'package:flutter/material.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/widgets/home_transaction_bottum_sheet.dart';

class WidgetSearchCards extends StatelessWidget {
  final TransactionModel modelObj;
  final icon;
  const WidgetSearchCards(
      {super.key,
      required this.modelObj, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 100,
        child: Card(
          elevation: 8,
          color: const Color.fromARGB(255, 14, 31, 51),
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
                      width: 70,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        modelObj.category.name,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      modelObj.date.toString().replaceRange(10, null, ''),
                      style: const TextStyle(color: Colors.white, fontSize: 10),
                    )
                  ],
                ),
                title: Padding(
                  padding: const EdgeInsets.only(left: 50),
                  child: Text(
                    "₹${modelObj.amount}",
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 206, 164, 52),
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                trailing: icon,
                ),
          ),
        ),
      ),
    );
  }
}
