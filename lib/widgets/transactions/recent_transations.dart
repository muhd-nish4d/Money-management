import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../db_functions/transactions/transaction_db_functions.dart';
import '../../models/transactions/transactions_model.dart';
import '../../screens/adding_income_expense_btn_screen.dart';
import '../home_transactions.dart';

class WidgetRecentTransactions extends StatelessWidget {
  const WidgetRecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    TransactionDB.instance.refreshTransUI();
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * .37,
      child: ValueListenableBuilder(
        valueListenable: TransactionDB.instance.transactionListNotifier,
        builder: (context, value, child) {
          return TransactionDB.instance.transactionListNotifier.value.isEmpty
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => const ScreenAddTransBtn()));
                  },
                  icon: const Icon(
                    Icons.add,
                    size: 50,
                  ))
              : GridView.builder(
                  // primary: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.1,
                    crossAxisSpacing: 40,
                    mainAxisSpacing: 20,
                  ),

                  itemBuilder: (context, index) {
                    final newValue = value[index];
                    final transObj = TransactionModel(
                      id: newValue.id,
                      amount: newValue.amount,
                      date: newValue.date,
                      note: newValue.note,
                      type: newValue.type,
                      category: newValue.category,
                    );
                    return WidgetHomeTransactions(
                      transObj: transObj,
                    );
                  },
                  itemCount: value.length <= 3 ? value.length : 4,
                );
        },
      ),
    );
  }
}
