import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/amount/amount_bloc.dart';
import 'package:tracker/blocs/category/category_bloc.dart';
import 'package:tracker/blocs/transactions/transactions_bloc.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/consts/toast.dart';

// import '../../models/category/category_model.dart';
import '../../consts/color.dart';
import '../../consts/container_shadow.dart';
import '../../consts/date_parse.dart';
import '../../models/category/category_model.dart';
import '../../problems/amount_totals.dart';
import '../../widgets/appBar/appbar.dart';
import '../../widgets/transactions/for_add_transactions.dart';

class ScreenAddTransBtn extends StatefulWidget {
  const ScreenAddTransBtn({super.key});

  @override
  State<ScreenAddTransBtn> createState() => _ScreenAddTransBtnState();
}

class _ScreenAddTransBtnState extends State<ScreenAddTransBtn> {
  DateTime? selectedDateTime = DateTime.now();
  CategoryType? selectedCategoryType = CategoryType.income;
  CategoryModel? selectedCategoryModel;
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  String? categoryID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backBlack,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(55),
          //AppBar
          child: WidgetAppBar(title: 'Income / Expense')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            //Radio buttons for catogery type.
            Row(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio<CategoryType>(
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => greyWhite,
                  ),
                  value: CategoryType.income,
                  groupValue: selectedCategoryType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategoryType = CategoryType.income;
                      categoryID = null;
                    });
                  },
                ),
                const Text(
                  'Income',
                  style: TextStyle(color: greyWhite, fontSize: 18),
                ),
                const SizedBox(
                  width: 50,
                ),
                Radio<CategoryType>(
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => greyWhite,
                  ),
                  value: CategoryType.expense,
                  groupValue: selectedCategoryType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedCategoryType = CategoryType.expense;
                      categoryID = null;
                    });
                  },
                ),
                const Text(
                  'Expense',
                  style: TextStyle(color: greyWhite, fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //Category name
            Padding(
              padding: const EdgeInsets.only(left: 13, right: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Category',
                    style: TextStyle(
                        color: greyWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  // SizedBox(
                  //   height: 200,
                  //   width: 200,
                  //   child: DropdownButton(

                  //     hint: Text('Select Category'),
                  //     items: [
                  //     DropdownMenuItem(child: Text('data'),value: 1,),
                  //     DropdownMenuItem(child: Text('nishad'),value: 2,),
                  //     DropdownMenuItem(child: Text('muhaim'),value: 3,),
                  //     DropdownMenuItem(child: Text('fahim'),value: 4,),

                  //   ], onChanged: (newValue){}),
                  // )
                  const SizedBox(
                    height: 10,
                  ),
                  //Category select and button
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .65,
                          height: 70,
                          child: Container(
                            decoration: BoxDecoration(
                                gradient: blueGreenGrad,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [containerShadow()]),
                            // borderOnForeground: true,
                            // elevation: 10,
                            // shape: RoundedRectangleBorder(
                            //     borderRadius: BorderRadius.circular(15),
                            //     //<-- SEE HERE
                            //     side: const BorderSide(
                            //       width: 2,
                            //       color: greyWhite,
                            //     )),

// ====================================================After Bloc=============================================
                            child: BlocBuilder<CategoryBloc, CategoryState>(
                                builder: (context, state) {
                              if (state is CategoryShow) {
                                return DropdownButtonHideUnderline(
                                  child: ButtonTheme(
                                    alignedDropdown: true,
                                    child: DropdownButton<String>(
                                        iconEnabledColor: Colors.black,
                                        iconDisabledColor: Colors.grey,
                                        value: categoryID,
                                        borderRadius: BorderRadius.circular(15),
                                        dropdownColor: greyWhite,
                                        hint: const Text(
                                          'Select category',
                                          style: TextStyle(color: backBlack),
                                        ),
                                        style:
                                            const TextStyle(color: backBlack),
                                        onChanged: (selectedValue) {
                                          setState(() {
                                            categoryID = selectedValue;
                                          });
                                        },
                                        items: (selectedCategoryType ==
                                                    CategoryType.income
                                                ? state.incomeCategories
                                                : state.expenseCategories)
                                            .map((e) {
                                          return DropdownMenuItem(
                                            value: e.id,
                                            child: Text(e.name),
                                            onTap: () {
                                              selectedCategoryModel = e;
                                            },
                                          );
                                        }).toList()),
                                  ),
                                );
                              } else {
                                return const Text('Something Error');
                              }
                            }),
// =========================================================================================================
                          ),
                        ),
                        //Amount add
                        SizedBox(
                          height: 60,
                          width: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              showCategoryAddPopupInTrans(context);
                            },
                            style: ElevatedButton.styleFrom(
                                elevation: 10, backgroundColor: backBlack),
                            child: const Icon(
                              Icons.add,
                              color: greyWhite,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Amount',
                    style: TextStyle(
                        color: greyWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: blueGreenGrad,
                            boxShadow: [containerShadow()],
                            borderRadius: BorderRadius.circular(15)),
                        height: 70,
                        width: MediaQuery.of(context).size.width * .84,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            keyboardType: TextInputType.number,
                            controller: amountController,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            showCursor: false,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: backBlack),
                            //   style: const TextStyle(
                            //       color: Color.fromARGB(255, 206, 164, 52)),
                            //   decoration: InputDecoration(
                            //     hintText: 'Type here',
                            //     hintStyle: const TextStyle(
                            //         color: Color.fromARGB(255, 114, 95, 41)),
                            //     label: const Text(
                            //       'Amount',
                            //       style: TextStyle(
                            //           color: Color.fromARGB(255, 206, 164, 52)),
                            //     ),
                            //     focusedBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(15.0),
                            //       borderSide: const BorderSide(
                            //           color: Color.fromARGB(255, 206, 164, 52),
                            //           width: 2),
                            //     ),
                            //     enabledBorder: OutlineInputBorder(
                            //       borderRadius: BorderRadius.circular(15.0),
                            //       borderSide: const BorderSide(
                            //         color: Color.fromARGB(255, 206, 164, 52),
                            //         width: 2.0,
                            //       ),
                            //     ),
                            //   ),
                            // )),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Date',
                    style: TextStyle(
                        color: greyWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {
                        final selectedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 30)),
                          lastDate: DateTime.now(),
                        );
                        if (selectedDate == null) {
                          return;
                        } else {
                          setState(() {
                            selectedDateTime = selectedDate;
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: backBlack,
                          shape: const BeveledRectangleBorder()),
                      // icon: const Icon(
                      //   Icons.edit_calendar_rounded,
                      //   color: backBlack,
                      // ),
                      // label: Text(
                      //   selectedDateTime.toString().replaceRange(10, null, ''),
                      //   style: const TextStyle(color: backBlack),
                      // ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          boxShadow: [containerShadow()],
                          gradient: blueGreenGrad,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.calendar_month_rounded,
                              color: backBlack,
                            ),
                            Text(
                              parseDate(selectedDateTime!),
                              // selectedDateTime
                              //     .toString()
                              //     .replaceRange(10, null, ''),
                              style: const TextStyle(
                                  color: backBlack,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Note',
                    style: TextStyle(
                        color: greyWhite,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Container(
                        decoration: BoxDecoration(
                            gradient: blueGreenGrad,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [containerShadow()]),
                        height: 200,
                        width: MediaQuery.of(context).size.width * .84,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            controller: noteController,
                            minLines: 5,
                            maxLines: 5,
                            decoration:
                                const InputDecoration(border: InputBorder.none),
                            showCursor: false,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: backBlack),
                            // style: const TextStyle(
                            //     color: Color.fromARGB(255, 206, 164, 52)),
                            // decoration: InputDecoration(
                            //   hintText: 'Type here',
                            //   hintStyle: const TextStyle(
                            //       color: Color.fromARGB(255, 114, 95, 41)),
                            //   label: const Text(
                            //     'Note',
                            //     style: TextStyle(
                            //         color: Color.fromARGB(255, 206, 164, 52)),
                            //   ),
                            //   focusedBorder: OutlineInputBorder(
                            //     borderRadius: BorderRadius.circular(15.0),
                            //     borderSide: const BorderSide(
                            //         color: Color.fromARGB(255, 206, 164, 52),
                            //         width: 2),
                            //   ),
                            //   enabledBorder: OutlineInputBorder(
                            //     // gapPadding: 40,
                            //     borderRadius: BorderRadius.circular(15.0),
                            //     borderSide: const BorderSide(
                            //       color: Color.fromARGB(255, 206, 164, 52),
                            //       width: 2.0,
                            //     ),
                            //   ),
                            // ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 70,
                    child: ElevatedButton(
                      onPressed: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                        selectedDateTime ??= DateTime.now();
                        addingTransactions();
                      },
                      style:
                          ElevatedButton.styleFrom(backgroundColor: backBlack),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        decoration: BoxDecoration(
                          boxShadow: [containerShadow()],
                          gradient: blueGreenGrad,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 23),
                          child: Text(
                            'Done',
                            style: TextStyle(
                              color: backBlack,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> addingTransactions() async {
    final amountText = amountController.text;
    final noteText = noteController.text;
    if (amountText.isEmpty ||
        noteText.isEmpty ||
        selectedCategoryModel == null ||
        selectedDateTime == null) {
      return showSnackBarr(context);
    }
    // if (noteText.isEmpty) {
    //   return;
    // }
    // if (selectedCategoryModel == null) {
    //   return;
    // }
    // if (selectedDateTime == null) {
    //   return;
    // }
    final parsedAmount = double.tryParse(amountText);
    if (parsedAmount == null) {
      return;
    }
    // final transModel = TransactionModel(
    //   id: DateTime.now().microsecondsSinceEpoch.toString(),
    //   amount: parsedAmount,
    //   date: selectedDateTime!,
    //   note: noteText,
    //   type: selectedCategoryType!,
    //   category: selectedCategoryModel!,
    // );
    //==================================After Bloc=========================================
    BlocProvider.of<TransactionsBloc>(context).add(TransactionAddEvent(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        amount: parsedAmount,
        dateTime: selectedDateTime!,
        note: noteText,
        type: selectedCategoryType!,
        category: selectedCategoryModel!));
    // BlocProvider.of<AmountBloc>(context).add(
    //     AmountCalcuteEvent(amuount: parsedAmount, type: selectedCategoryType!));
    BlocProvider.of<AmountBloc>(context).add(AmountInitialEvent());

    // await TransactionDB.instance.transactionAdd(transModel);

    showToast(message: 'Saved');
    // TransactionDB.instance.refreshTransUI();
    // await Amounts.instance.totalAmount();
    // Amounts.instance.totalAmount();
    //==================================After Bloc=========================================
    Navigator.of(context).pop();
    // TransactionDB.instance.transactionListNotifier.notifyListeners();
  }
}





//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter