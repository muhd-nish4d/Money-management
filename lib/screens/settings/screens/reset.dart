import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/transactions/transactions_bloc.dart';
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
                //after bloc
                // CategoryDB.instance.categoryClear();
                // TransactionDB.instance.transactionClear();
                BlocProvider.of<TransactionsBloc>(context)
                    .add(TransactionsClearEvent());
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
