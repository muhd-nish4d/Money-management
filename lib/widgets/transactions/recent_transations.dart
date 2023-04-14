import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/widgets/home_screen/status_screen.dart';
import '../../blocs/transactions/transactions_bloc.dart';
import '../../db_functions/transactions/transaction_db_functions.dart';
import '../../models/transactions/transactions_model.dart';
import '../../screens/transactions/adding_income_expense_btn_screen.dart';
import 'home_transactions.dart';

class WidgetRecentTransactions extends StatelessWidget {
  const WidgetRecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    //==================================After Bloc=========================================
    // TransactionDB.instance.refreshTransUI();
    //==================================After Bloc=========================================
    return SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * .37,
        child: BlocBuilder<TransactionsBloc, TransactionsState>(
          builder: (context, state) {
            if (state is TransactionsInitialState) {
              return Container();
            } else if (state is TransactionsLodingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is TransactionsShowState) {
              return state.transactions.isEmpty
                  ? const Center(child: Text('No Data'))
                  : GridView.builder(
                      // primary: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.1,
                        crossAxisSpacing: 40,
                        mainAxisSpacing: 20,
                      ),

                      itemBuilder: (context, index) {
                        final newValue = state.transactions[index];
                        // final newValue = value[index];
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
                      itemCount: state.transactions.length <= 3
                          ? state.transactions.length
                          : 4,
                    );
            }
            return Container();
          },
        ));
  }
}

/*
ValueListenableBuilder(
        // valueListenable: TransactionDB.instance.transactionListNotifier,
        valueListenable: val,
        builder: (context, value, child) {
          // return TransactionDB.instance.transactionListNotifier.value.isEmpty
          return val.value.isEmpty
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

*/