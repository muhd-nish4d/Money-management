import 'package:flutter/material.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/db_functions/transactions/transaction_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';
import 'package:tracker/models/transactions/transactions_model.dart';
import 'package:tracker/problems/amount_totals.dart';

import '../widgets/toast.dart';

class ScreenEdit extends StatefulWidget {
  final TransactionModel transobj;
  const ScreenEdit({super.key, required this.transobj});

  @override
  State<ScreenEdit> createState() => _ScreenEditState();
}

class _ScreenEditState extends State<ScreenEdit> {
  TextEditingController amountCantroller = TextEditingController();
  TextEditingController notesController = TextEditingController();
  CategoryType selectedCategoryTypeinEdit = CategoryType.income;
  DateTime? selectedDateinEdit;
  CategoryModel? selectedCategoryModelinEdit;
  String? categoryId;

  @override
  void initState() {
    amountCantroller =
        TextEditingController(text: widget.transobj.amount.toString());
    notesController = TextEditingController(text: widget.transobj.note);
    selectedDateinEdit = widget.transobj.date;
    selectedCategoryTypeinEdit = widget.transobj.type;
    selectedCategoryModelinEdit = widget.transobj.category;
    super.initState();
  }

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
                    value: CategoryType.income,
                    groupValue: selectedCategoryTypeinEdit,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategoryTypeinEdit = CategoryType.income;
                        categoryId = null;
                      });
                    },
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 206, 164, 52),
                    )),
                const Text(
                  'Income',
                  style: TextStyle(
                      color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
                ),
                const SizedBox(
                  width: 50,
                ),
                Radio<CategoryType>(
                    value: CategoryType.expense,
                    groupValue: selectedCategoryTypeinEdit,
                    onChanged: (newValue) {
                      setState(() {
                        selectedCategoryTypeinEdit = CategoryType.expense;
                        categoryId = null;
                      });
                    },
                    fillColor: MaterialStateColor.resolveWith(
                      (states) => const Color.fromARGB(255, 206, 164, 52),
                    )),
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
                  const SizedBox(
                    height: 10,
                  ),
                  //Category select and button
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .93,
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
                          child: DropdownButton(
                              iconDisabledColor: Colors.grey,
                              iconEnabledColor:
                                  const Color.fromARGB(255, 206, 164, 52),
                              value: categoryId,
                              borderRadius: BorderRadius.circular(15),
                              dropdownColor:
                                  const Color.fromARGB(255, 14, 31, 51),
                              hint: const Text(
                                'Select category',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 206, 164, 52)),
                              ),
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 206, 164, 52)),
                              onChanged: (value) {
                                setState(() {
                                  categoryId = value;
                                });
                              },
                              items: (selectedCategoryTypeinEdit ==
                                          CategoryType.income
                                      ? CategoryDB().incomeCategoryList
                                      : CategoryDB().expenseCategoryList)
                                  .value
                                  .map((e) {
                                return DropdownMenuItem(
                                  value: e.id,
                                  child: Text(e.name),
                                  onTap: () {
                                    selectedCategoryModelinEdit = e;
                                  },
                                );
                              }).toList()),
                        ),
                      ),
                    ),
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
                        controller: amountCantroller,
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
                        final editedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate:
                              DateTime.now().subtract(const Duration(days: 30)),
                          lastDate: DateTime.now(),
                        );
                        setState(() {
                          selectedDateinEdit = editedDate;
                        });
                      },
                      icon: const Icon(
                        Icons.edit_calendar_rounded,
                        color: Color.fromARGB(255, 206, 164, 52),
                      ),
                      label: Text(
                        selectedDateinEdit
                            .toString()
                            .replaceRange(10, null, ''),
                        style:
                            const TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
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
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: TextFormField(
                        minLines: 7,
                        maxLines: 10,
                        controller: notesController,
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
        backgroundColor: const Color.fromARGB(255, 14, 31, 51),
          onPressed: () {
            editTransaction();
          },
          child: const Icon(
            Icons.thumb_up_alt,
            color: Color.fromARGB(255, 206, 164, 52),
          )),
    );
  }

  Future<void> editTransaction() async {
    final textAmount = amountCantroller.text;
    final textNote = notesController.text;
    if (textAmount.isEmpty) {
      // print('text amount null');
      return;
    }
    if (textNote.isEmpty) {
      return;
    }
    if (selectedDateinEdit == null) {
      return;
    }
    final parsedEditAmount = double.tryParse(textAmount);
    if (parsedEditAmount == null) {
      return;
    }
    final transEditModel = TransactionModel(
      id: widget.transobj.id,
      amount: parsedEditAmount,
      date: selectedDateinEdit!,
      note: textNote,
      type: selectedCategoryTypeinEdit,
      category: selectedCategoryModelinEdit!,
    );
    await TransactionDB.instance.editTransactionDb(transEditModel);
    showToast(message: 'Edited');
    TransactionDB.instance.refreshTransUI();
    await Amounts.instance.totalAmount();
    Amounts.instance.totalAmount();
    Navigator.of(context).pop();
  }
}
