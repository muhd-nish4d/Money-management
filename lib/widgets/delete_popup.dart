import 'package:flutter/material.dart';
import 'package:tracker/widgets/toast.dart';

import '../db_functions/transactions/transaction_db_functions.dart';
import '../problems/amount_totals.dart';

Future<void> alertMassege(BuildContext ctx, {required String id}) async {
  return showDialog(
    context: ctx,
    builder: (context) {
      return AlertDialog(
        title: const Text('Delete !'),
        content: const Text('Are you sure for delet?'),
        actions: [
          TextButton(
              onPressed: () async {
                await TransactionDB.instance.deleteTransactions(id);
                showToast(message: 'Deleted');
                await Amounts.instance.totalAmount();
                Amounts.instance.totalAmount();
                Navigator.of(context).pop();
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
