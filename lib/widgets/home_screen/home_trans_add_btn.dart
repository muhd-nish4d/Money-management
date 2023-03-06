import 'package:flutter/material.dart';

import '../../color/color.dart';
import '../../screens/transactions/adding_income_expense_btn_screen.dart';

class WidgetTransactionAddButton extends StatelessWidget {
  final String category;
  const WidgetTransactionAddButton({super.key, required this.category });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: MediaQuery.of(context).size.width * .4,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              elevation: 20, backgroundColor: Colors.black),
          onPressed: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => const ScreenAddTransBtn()));
          },
          child:  Text(
            category,
            style: TextStyle(
                color: greyWhite, fontSize: 20, fontWeight: FontWeight.bold),
          )),
    );
  }
}
