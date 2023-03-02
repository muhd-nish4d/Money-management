import 'package:flutter/material.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/problems/amount_totals.dart';
import 'package:tracker/screens/adding_income_expense_btn_screen.dart';
import 'package:tracker/screens/category_main_screen.dart';
import 'package:tracker/screens/search_screen.dart';
import 'package:tracker/widgets/home_transactions.dart';

import '../color/color.dart';
import '../widgets/appBar/appbar.dart';
import '../widgets/drawer_widget.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Amounts.instance.totalAmount();
    // TransactionDB.instance.refreshTransUI();
    return Scaffold(
      //rgb(247, 247, 247)
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          child: WidgetAppBar(title: 'Money Tracker')),
      drawer: const Drawer(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                topRight: Radius.circular(15))),
        backgroundColor: Color.fromARGB(255, 18, 41, 72),
        child: WidgetDrawer(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Flexible(
                    flex: 2,
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          //rgb(57, 62, 70)
                          //rgb(109, 152, 134)
                          color: const Color.fromARGB(255, 109, 152, 134)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                    color: greyd,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold),
                              ),
                              ValueListenableBuilder(
                                valueListenable: Amounts.instance.totalResult,
                                builder: (context, value, child) {
                                  return Text(
                                    '₹$value',
                                    style: const TextStyle(
                                        // rgb(242, 231, 213)
                                        color: greyd,
                                        fontSize: 40,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold),
                                  );
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.arrow_upward_rounded,
                                          color: greyd),
                                      Text(
                                        'Income',
                                        style: TextStyle(
                                            color: greyd,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Amounts.instance.incomeResult,
                                    builder: (context, value, child) {
                                      return Text(
                                        '₹$value',
                                        style: const TextStyle(
                                            color: greyd,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    children: const [
                                      Icon(Icons.arrow_downward_rounded,
                                          color: greyd),
                                      Text(
                                        'Expense',
                                        style: TextStyle(
                                            color: greyd,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  ValueListenableBuilder(
                                    valueListenable:
                                        Amounts.instance.expenseResult,
                                    builder: (context, value, child) {
                                      return Text(
                                        '₹$value',
                                        style:const TextStyle(
                                            color: greyd,
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'Inter'),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25)),
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 255, 232)),
                                  onPressed: () {
                                    // Navigator.of(context).push(
                                    //     MaterialPageRoute(
                                    //         builder: (ctx) =>
                                    //             const ScreenCircleChart()));
                                    Amounts().totalAmount();
                                  },
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 9),
                                    child: Column(
                                      children: const [
                                        Icon(Icons.analytics_rounded,
                                            color: greyd),
                                        SizedBox(),
                                        Text(
                                          'Observe',
                                          style: TextStyle(
                                            color: greyd,
                                          ),
                                        )
                                      ],
                                    ),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Flexible(
                      flex: 3,
                      child: Container(
                        width: double.infinity,

                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            //rgb(109, 152, 134)
                            color: darkGreeno),
                        //   child: Column(
                        //     children: [
                        //       Padding(
                        //         padding: const EdgeInsets.only(left: 15, right: 8),
                        //         child: Row(
                        //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //           children: [
                        //             Text(
                        //               'Recent',
                        //               style: TextStyle(
                        //                   color: Color.fromARGB(255, 206, 164, 52),
                        //                   fontWeight: FontWeight.bold,
                        //                   fontSize: 20),
                        //             ),
                        //             TextButton(
                        //                 onPressed: () {},
                        //                 child: Text(
                        //                   'View all',
                        //                   style: TextStyle(
                        //                       color:
                        //                           Color.fromARGB(255, 206, 164, 52)),
                        //                 ))
                        //           ],
                        //         ),
                        //       ),
                        // GridView.builder(
                        //     gridDelegate:
                        //         SliverGridDelegateWithFixedCrossAxisCount(
                        //             crossAxisCount: 2),
                        //     itemBuilder: (context, index) {
                        //       trans[index];
                        //     },
                        //     itemCount: trans.length,
                        //     )
                        //     ],
                        //   ),
                        // ),
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    'Recent',
                                    style: TextStyle(
                                        color: greyd,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        showSearch(
                                          context: context,
                                          delegate: ScreenSearch(),
                                          // useRootNavigator: false
                                        );
                                      },
                                      child: const Text(
                                        'View all',
                                        style: TextStyle(color: greyd),
                                      ))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: SizedBox(
                                width: double.infinity,
                                height:
                                    MediaQuery.of(context).size.height * .37,
                                child: ValueListenableBuilder(
                                  valueListenable: TransactionDB
                                      .instance.transactionListNotifier,
                                  builder: (context, value, child) {
                                    return TransactionDB
                                            .instance
                                            .transactionListNotifier
                                            .value
                                            .isEmpty
                                        ? IconButton(
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          const ScreenAddTransBtn()));
                                            },
                                            icon: const Icon(
                                              Icons.add,
                                              size: 50,
                                            ))
                                        : GridView.builder(
                                            // primary: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            gridDelegate:
                                                const SliverGridDelegateWithFixedCrossAxisCount(
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
                                            itemCount: value.length <= 3
                                                ? value.length
                                                : 4,
                                          );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: MediaQuery.of(context).size.width * .4,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 109, 152, 134)),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const ScreenAddTransBtn()));
                            },
                            child: const Text(
                              'Income',
                              style: TextStyle(
                                  color: greyWhite,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .4,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 109, 152, 134),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const ScreenAddTransBtn()));
                            },
                            child: const Text('Expense',
                                style: TextStyle(
                                    color: greyWhite,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold))),
                      ),
                      
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 9),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: CircleAvatar(
                  backgroundColor: const Color.fromARGB(255, 247, 247, 247),
                  radius: 50,
                  child: CircleAvatar(
                      radius: 43,
                      backgroundColor: darkGreeno,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => const ScreenCategory(),
                          ));
                        },
                        icon: const Icon(
                          Icons.difference_rounded,
                          color: greyWhite,
                          size: 35,
                        ),
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}




//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
