import 'package:flutter/material.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/widgets/toast.dart';

import '../models/category/category_model.dart';
import '../widgets/for_add_transactions.dart';

class ScreenAddTransBtn extends StatefulWidget {
  const ScreenAddTransBtn({super.key});

  @override
  State<ScreenAddTransBtn> createState() => _ScreenAddTransBtnState();
}

class _ScreenAddTransBtnState extends State<ScreenAddTransBtn> {
  DateTime? selectedDateTime;
  CategoryType? selectedCategoryType = CategoryType.income;
  CategoryModel? selectedCategoryModel;
  final amountController = TextEditingController();
  final noteController = TextEditingController();
  String? categoryID;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 18, 41, 72),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 14, 31, 51),
        iconTheme:
            const IconThemeData(color: Color.fromARGB(255, 206, 164, 52)),
        title: const Text(
          'Income / Expense',
          style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    (states) => const Color.fromARGB(255, 206, 164, 52),
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
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
                ),
                const SizedBox(
                  width: 50,
                ),
                Radio<CategoryType>(
                  fillColor: MaterialStateColor.resolveWith(
                    (states) => const Color.fromARGB(255, 206, 164, 52),
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
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
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
                        color: Color.fromARGB(255, 206, 164, 52),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .75,
                        height: 70,
                        child: Card(
                          color: const Color.fromARGB(255, 18, 41, 72),
                          // borderOnForeground: true,
                          // elevation: 10,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                              //<-- SEE HERE
                              side: const BorderSide(
                                width: 2,
                                color: Color.fromARGB(255, 206, 164, 52),
                              )),

                          child: DropdownButtonHideUnderline(
                            child: ButtonTheme(
                              alignedDropdown: true,
                              child: DropdownButton<String>(
                                  value: categoryID,
                                  borderRadius: BorderRadius.circular(15),
                                  dropdownColor:
                                      const Color.fromARGB(255, 14, 31, 51),
                                  hint: const Text(
                                    'Select category',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 206, 164, 52)),
                                  ),
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 206, 164, 52)),
                                  onChanged: (selectedValue) {
                                    setState(() {
                                      categoryID = selectedValue;
                                    });
                                  },
                                  items: (selectedCategoryType ==
                                              CategoryType.income
                                          ? CategoryDB().incomeCategoryList
                                          : CategoryDB().expenseCategoryList)
                                      .value
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
                          ),
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
                              backgroundColor:
                                  const Color.fromARGB(255, 206, 164, 52)),
                          child: const Icon(
                            Icons.add,
                            color: Color.fromARGB(255, 18, 41, 72),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Amount',
                    style: TextStyle(
                        color: Color.fromARGB(255, 206, 164, 52),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 70,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: amountController,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 206, 164, 52)),
                        decoration: InputDecoration(
                          hintText: 'Type here',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 114, 95, 41)),
                          label: const Text(
                            'Amount',
                            style: TextStyle(
                                color: Color.fromARGB(255, 206, 164, 52)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 206, 164, 52),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 206, 164, 52),
                              width: 2.0,
                            ),
                          ),
                        ),
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Date',
                    style: TextStyle(
                        color: Color.fromARGB(255, 206, 164, 52),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    child: OutlinedButton.icon(
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
                      icon: const Icon(
                        Icons.edit_calendar_rounded,
                        color: Color.fromARGB(255, 206, 164, 52),
                      ),
                      label: Text(
                        selectedDateTime == null
                            ? DateTime.now()
                                .toString()
                                .replaceRange(10, null, '')
                            : selectedDateTime
                                .toString()
                                .replaceRange(10, null, ''),
                        style: const TextStyle(
                            color: Color.fromARGB(255, 206, 164, 52)),
                      ),
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          side: const BorderSide(
                            color: Color.fromARGB(255, 206, 164, 52),
                            width: 2,
                          )),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Note',
                    style: TextStyle(
                        color: Color.fromARGB(255, 206, 164, 52),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        controller: noteController,
                        minLines: 5,
                        maxLines: 5,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 206, 164, 52)),
                        decoration: InputDecoration(
                          hintText: 'Type here',
                          hintStyle: const TextStyle(
                              color: Color.fromARGB(255, 114, 95, 41)),
                          label: const Text(
                            'Note',
                            style: TextStyle(
                                color: Color.fromARGB(255, 206, 164, 52)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 206, 164, 52),
                                width: 2),
                          ),
                          enabledBorder: OutlineInputBorder(
                            // gapPadding: 40,
                            borderRadius: BorderRadius.circular(15.0),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 206, 164, 52),
                              width: 2.0,
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromARGB(255, 14, 31, 51),
          onPressed: () {
            selectedDateTime ??= DateTime.now();
            addingTransactions();
          },
          child: Icon(
            Icons.add,
            color: Color.fromARGB(255, 206, 164, 52),
          )),
    );
  }

  Future<void> addingTransactions() async {
    final amountText = amountController.text;
    final noteText = noteController.text;
    if (amountText.isEmpty || noteText.isEmpty || selectedCategoryModel == null || selectedDateTime == null) {
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
    final transModel = TransactionModel(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      amount: parsedAmount,
      date: selectedDateTime!,
      note: noteText,
      type: selectedCategoryType!,
      category: selectedCategoryModel!,
    );
    await TransactionDB.instance.transactionAdd(transModel);
    showToast(message: 'Saved');
    Navigator.of(context).pop();
    TransactionDB.instance.refreshTransUI();
  }
}





//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter