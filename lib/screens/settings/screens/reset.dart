import 'package:flutter/material.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';

import '../../splash/splash_screen.dart';

Future<void> resetAlert(BuildContext ctx) async {
  return showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: const Text('Reset !'),
        content: const Text('All your transactions & categories will be gone'),
        actions: [
          TextButton(
              onPressed: () async {
                CategoryDB.instance.categoryClear();
                TransactionDB.instance.transactionClear();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (ctx) => const ScreenSplash(),
                    ),
                    (route) => false);
              },
              child: const Text('Yes')),
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'))
        ],
      );
    },
  );
}
