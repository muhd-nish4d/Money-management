import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/screens/transactions/edit_screen.dart';
import 'package:tracker/consts/delete_popup.dart';

import '../../consts/date_parse.dart';


Future<void> showHomeBottumSheet(BuildContext ctx,
    {required TransactionModel transactionObj}) async {
  //new added
  Widget buildBottomSheet(
    BuildContext context,
    ScrollController scrollController,
    double bottomSheetOffset,
  ) {
    return Material(
      color: backBlack,
      child: SizedBox(
        child: ListView(
          controller: scrollController,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (ctx) =>
                                ScreenEdit(transobj: transactionObj)));
                        // Amounts.instance.totalAmount();
                      },
                      icon: const Icon(
                        Icons.edit,
                        color: gradBlue,
                      ),
                    ),
                    IconButton(
                      onPressed: () async {
                        Navigator.of(ctx).pop();
                        alertMassege(context,id: transactionObj.id.toString());
                       
                        
                        // TransactionDB.instance.transactionListNotifier.notifyListeners();
                      },
                      icon: const Icon(
                        Icons.delete_rounded,
                        color: gradGreen,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ListTile(
              leading: const Text(
                'Category type  :',
                style: TextStyle(
                    color: greyWhite, fontSize: 20),
              ),
              title: Text(transactionObj.type.name.toUpperCase(),
                  style: const TextStyle(
                      color: greyWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            //Category name
            ListTile(
              leading: const Text(
                'Category          :',
                style: TextStyle(
                    color: greyWhite, fontSize: 20),
              ),
              title: Text(transactionObj.category.name,
                  style: const TextStyle(
                      color: greyWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            //Amount
            ListTile(
              leading: const Text(
                'Amount            :',
                style: TextStyle(
                    color: greyWhite, fontSize: 20),
              ),
              title: Text("₹ ${transactionObj.amount.toString()}",
                  style: const TextStyle(
                      color: greyWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            //Date
            ListTile(
              leading: const Text(
                'Date                  :',
                style: TextStyle(
                    color: greyWhite, fontSize: 20),
              ),
              title: Text(
                parseDate(transactionObj.date),
                  // transactionObj.date.toString().replaceRange(10, null, ''),
                  style: const TextStyle(
                      color: greyWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            ),
            //Note
            ListTile(
              leading: const Text(
                'Note                 :',
                style: TextStyle(
                    color: greyWhite, fontSize: 20),
              ),
              title: Text(transactionObj.note,
                  style: const TextStyle(
                      color: greyWhite,
                      fontSize: 20,
                      fontWeight: FontWeight.bold)),
            )
          ],
        ),
      ),
    );
  }

  showFlexibleBottomSheet(
    minHeight: 0,
    initHeight: 0.5,
    maxHeight: 0.93,
    context: ctx,
    builder: buildBottomSheet,
    anchors: [0, 0.5, 0.93],
    isSafeArea: true,
  );
  // last
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter






// showModalBottomSheet(
//     backgroundColor: const Color.fromARGB(255, 14, 31, 51),
//     shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(15), topRight: Radius.circular(15))),
//     context: (ctx),
//     builder: (context) {
//       return SizedBox(
//         height: 500,
//         child: Column(
//           children: [
//             //Icon buttons
           
      //     ],
      //   ),
      // );
//     },
//   );