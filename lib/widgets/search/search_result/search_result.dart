import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tracker/consts/color.dart';
import 'package:tracker/consts/delete_popup.dart';
import 'package:tracker/widgets/home_screen/status_screen.dart';
import 'package:tracker/widgets/search/search_screen_cards.dart';
import '../../../models/transactions/transactions_model.dart';
import '../../../problems/amount_totals.dart';
import '../../../screens/search/search_screen.dart';
import '../../../screens/transactions/edit_screen.dart';
import 'grid_search.dart';
import 'list_search.dart';

class WidgerSearchResult extends StatefulWidget {
  final String query;
  const WidgerSearchResult({
    super.key,
    required this.query,
  });

  @override
  State<WidgerSearchResult> createState() => _WidgerSearchResultState();
}

class _WidgerSearchResultState extends State<WidgerSearchResult> {
  // bool hi = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      color: backBlack,
      child: ValueListenableBuilder(
        //==================================After Bloc=========================================
        // valueListenable: filterListener,
        valueListenable: val,
        //==================================After Bloc=========================================
        builder: (context, newValue, child) {
          return
              // searchReturn(newValue);
              //==================================After Bloc=========================================
              // filterListener.value.isEmpty
              val.value
                  //==================================After Bloc=========================================
                  ? const Center(
                      child: Text(
                        'No data',
                        style: TextStyle(
                            color: greyWhite,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    )
                  :
                  // : hi == false
                  // WidgetSearchListResult(
                  //     newValue: newValue, query: widget.query);
                  // : WidgetSearchGridResult(
                  //     newValue: newValue, query: widget.query);
                  ListView.builder(
                      itemBuilder: (context, index) {
                        final value = newValue[index];
                        if (value.category.name
                                .toLowerCase()
                                .contains(widget.query.toLowerCase().trim()) ||
                            value.amount
                                .toString()
                                .toLowerCase()
                                .contains(widget.query.toLowerCase().trim()) ||
                            value.note
                                .toString()
                                .toLowerCase()
                                .contains(widget.query.toLowerCase().trim())) {
                          return Slidable(
                            startActionPane: ActionPane(
                                motion: const StretchMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: (ctx) async {
                                      alertMassege(context,
                                          id: value.id.toString());
                                      //==================================After Bloc=========================================
                                      //  Amounts().totalAmount();
                                      //==================================After Bloc=========================================
                                    },
                                    backgroundColor: backBlack,
                                    borderRadius: BorderRadius.circular(15),
                                    foregroundColor: Colors.red,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                  SlidableAction(
                                    onPressed: (ctx) {
                                      final TransactionModel transmodel =
                                          TransactionModel(
                                              id: value.id,
                                              amount: value.amount,
                                              date: value.date,
                                              note: value.note,
                                              type: value.type,
                                              category: value.category);

                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) => ScreenEdit(
                                                  transobj: transmodel)));
                                    },
                                    backgroundColor: backBlack,
                                    borderRadius: BorderRadius.circular(15),
                                    foregroundColor: Colors.blue,
                                    icon: Icons.edit,
                                    label: 'Edit',
                                  ),
                                ]),
                            key: Key(value.id!),
                            child: WidgetSearchCards(
                              modelObj: value,
                              icon: value.type.index == 0
                                  ? const Icon(
                                      Icons.arrow_upward,
                                      color: Colors.green,
                                    )
                                  : const Icon(
                                      Icons.arrow_downward,
                                      color: Colors.red,
                                    ),
                            ),
                          );
                        } else {
                          return Container();
                        }
                      },
                      itemCount: newValue.length,
                    );
          //  Expanded(
          //     child: GridView.builder(
          //       gridDelegate:
          //           const SliverGridDelegateWithFixedCrossAxisCount(
          //               crossAxisSpacing: 10,
          //               mainAxisSpacing: 10,
          //               crossAxisCount: 2),
          //       itemBuilder: (context, index) {
          //         // final value = newValue[index];
          //         return Container(
          //           color: greyWhite,
          //           child: const Center(child: Text('data')),
          //         );
          //       },
          //       itemCount: newValue.length,
          //     ),
          //   );
          //                        ValueListenableBuilder(
          // valueListenable: CategoryDB().incomeCategoryList,
          // builder: (BuildContext ctx, List<CategoryModel> incomeList, Widget? _) {
          //   return Padding(
          //     padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          //     child: GridView.builder(
          //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //           childAspectRatio: 1.6,
          //           crossAxisSpacing: 30,
          //           mainAxisSpacing: 30,
          //           crossAxisCount: 2),
          //       itemBuilder: (context, index) {
          //         final income = incomeList[index];
          //         return SizedBox(
          //           child: ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //               backgroundColor: backBlack,
          //             ),
          //             onPressed: () {},

          // ? const Center(
          //     child: Text(
          //       'No data',
          //       style: TextStyle(
          //           color: greyWhite,
          //           fontWeight: FontWeight.bold,
          //           fontSize: 20),
          //     ),
          //   )
          // : ListView.builder(
          //     itemBuilder: (context, index) {
          //       final value = newValue[index];
          //       if (value.category.name
          //               .toLowerCase()
          //               .contains(widget.query.toLowerCase().trim()) ||
          //           value.amount
          //               .toString()
          //               .toLowerCase()
          //               .contains(widget.query.toLowerCase().trim()) ||
          //           value.note
          //               .toString()
          //               .toLowerCase()
          //               .contains(widget.query.toLowerCase().trim())) {
          //         return Slidable(
          //           startActionPane: ActionPane(
          //               motion: const StretchMotion(),
          //               children: [
          //                 SlidableAction(
          //                   onPressed: (ctx) async {
          //                     alertMassege(context,
          //                         id: value.id.toString());
          //                     Amounts().totalAmount();
          //                   },
          //                   backgroundColor: backBlack,
          //                   borderRadius: BorderRadius.circular(15),
          //                   foregroundColor: Colors.red,
          //                   icon: Icons.delete,
          //                   label: 'Delete',
          //                 ),
          //                 SlidableAction(
          //                   onPressed: (ctx) {
          //                     final TransactionModel transmodel =
          //                         TransactionModel(
          //                             id: value.id,
          //                             amount: value.amount,
          //                             date: value.date,
          //                             note: value.note,
          //                             type: value.type,
          //                             category: value.category);

          //                     Navigator.of(context).push(
          //                         MaterialPageRoute(
          //                             builder: (ctx) => ScreenEdit(
          //                                 transobj: transmodel)));
          //                   },
          //                   backgroundColor: backBlack,
          //                   borderRadius: BorderRadius.circular(15),
          //                   foregroundColor: Colors.blue,
          //                   icon: Icons.edit,
          //                   label: 'Edit',
          //                 ),
          //               ]),
          //           key: Key(value.id!),
          //           child: WidgetSearchCards(
          //             modelObj: value,
          //             icon: value.type.index == 0
          //                 ? const Icon(
          //                     Icons.arrow_upward,
          //                     color: Colors.green,
          //                   )
          //                 : const Icon(
          //                     Icons.arrow_downward,
          //                     color: Colors.red,
          //                   ),
          //           ),
          //         );
          //       } else {
          //         return Container();
          //       }
          //     },
          //     itemCount: newValue.length,
          //   );
        },
      ),
    );
  }
}
// class ListIcon extends StatelessWidget {
//   const ListIcon({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }
