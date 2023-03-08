import 'package:flutter/material.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/problems/amount_totals.dart';
import '../../consts/color.dart';
import '../../widgets/appBar/appbar.dart';
import '../../widgets/drawer/drawer_widget.dart';
import '../../widgets/category/category_add_btn.dart';
import '../../widgets/home_screen/home_trans_add_btn.dart';
import '../../widgets/home_screen/recent_widget.dart';
import '../../widgets/home_screen/status_screen.dart';
import '../../widgets/search/popupmenu_datepicker.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    Amounts.instance.totalAmount();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      TransactionDB.instance.refreshTransUI();
    });
    // Amounts.instance.totalAmount();
    // TransactionDB.instance.refreshTransUI();
    return Scaffold(
      //rgb(247, 247, 247)
      backgroundColor: backBlack,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          //AppBar
          child: WidgetAppBar(title: 'Money Tracker')),
      //Drawer
      drawer: const WidgetDrawer(),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  //Status Screen
                  const Flexible(flex: 2, child: WidgetSatusScreen()),
                  const SizedBox(
                    height: 15,
                  ),
                  //RecentScreen
                  const Flexible(flex: 3, child: WidgetRecentScreen()),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      //Transaction adding Buttons
                      WidgetTransactionAddButton(category: 'Income'),
                      WidgetTransactionAddButton(category: 'Expense'),
                    ],
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 9),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  //Category adding button
                  child: WidgetCategoryAddBtn()),
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
