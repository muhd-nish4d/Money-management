// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:tracker/consts/color.dart';
// import 'package:tracker/consts/date_parse.dart';

// import '../../db_functions/transactions/transaction_db_functions.dart';

// class Classverth {}

// DateTime? firstSelctedDate;
// DateTime? lastSelectedDate;

// class WidgetPopupMenuDatePick extends StatefulWidget {
//   const WidgetPopupMenuDatePick({super.key});

//   @override
//   State<WidgetPopupMenuDatePick> createState() =>
//       _WidgetPopupMenuDatePickState();
// }

// class _WidgetPopupMenuDatePickState extends State<WidgetPopupMenuDatePick> {
//   DateTime? selectedFirstDate;
//   DateTime? selectedSecondDate;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         TextButton(
//             onPressed: () async {
//               final selectedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now().subtract(const Duration(days: 30)),
//                   lastDate: DateTime.now());
//               if (selectedDate == null) {
//                 return;
//               } else {
//                 firstSelctedDate = selectedDate;
//                 setState(() {
//                   selectedFirstDate = selectedDate;
//                 });
//                 // hello(selectedFirstDate!);
//               }
//             },
//             child: Text(firstSelctedDate == null
//                 ? 'Start'
//                 : parseDate(firstSelctedDate!))),
//         TextButton(
//             onPressed: () async {
//               final selectedDate = await showDatePicker(
//                   context: context,
//                   initialDate: DateTime.now(),
//                   firstDate: DateTime.now().subtract(const Duration(days: 30)),
//                   lastDate: DateTime.now());
//               if (selectedDate == null) {
//                 return;
//               } else {
//                 lastSelectedDate = selectedDate;
//                 setState(() {
//                   selectedSecondDate = selectedDate;
//                 });
//                 // hi(selectedSecondDate!);
//               }
//             },
//             child: Text(lastSelectedDate == null
//                 ? 'End'
//                 : parseDate(lastSelectedDate!))),
//         Icon(
//           Icons.check,
//           color: backBlack,
//         )
//       ],
//     );
//   }
//   // }
//   // DateTime hi(DateTime a){
//   //   return a;
//   // }
//   // DateTime hello(DateTime b){
//   //   return b;
//   // }
// }
