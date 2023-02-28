import 'package:flutter/material.dart';
import 'package:tracker/widgets/toast.dart';

import '../db_functions/category/category_db_functions.dart';
import '../models/category/category_model.dart';
import '../screens/category_main_screen.dart';

Future<void> showEditBottumSheet(BuildContext ctx,
    {required String? categoryName, required String idCategory}) async {
  final catogerynameEditingController =
      TextEditingController(text: categoryName);
  showModalBottomSheet(
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15))),
    context: ctx,
    backgroundColor: const Color.fromARGB(255, 14, 31, 51),
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                // Radio(
                //     fillColor: MaterialStateColor.resolveWith(
                //       (states) => const Color.fromARGB(255, 206, 164, 52),
                //     ),
                //     value: null,
                //     groupValue: null,
                //     onChanged: (null)),
                // const Text(
                //   'Income',
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
                // ),
                // const SizedBox(
                //   width: 20,
                // ),
                // Radio(
                //     fillColor: MaterialStateColor.resolveWith(
                //       (states) => const Color.fromARGB(255, 206, 164, 52),
                //     ),
                //     value: null,
                //     groupValue: 1,
                //     onChanged: (null)),
                // const Text(
                //   'Expense',
                //   style: TextStyle(
                //       color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
                // )
                RadioButtonWidget(title: 'Income', type: CategoryType.income),
                RadioButtonWidget(title: 'Expense', type: CategoryType.expense)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: TextFormField(
                controller: catogerynameEditingController,
                style:
                    const TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
                decoration: InputDecoration(
                  hintText: 'Type here',
                  hintStyle:
                      const TextStyle(color: Color.fromARGB(255, 114, 95, 41)),
                  label: const Text(
                    'Category',
                    style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                        color: Color.fromARGB(255, 206, 164, 52), width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                      color: Color.fromARGB(255, 206, 164, 52),
                      width: 2.0,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 206, 164, 52)),
                  onPressed: () async {
                    final categoryName = catogerynameEditingController.text;
                    if (categoryName.isEmpty) {
                      return;
                    }
                    final type = selectedCategoryType.value;
                    final category = CategoryModel(
                      id: idCategory,
                      name: categoryName,
                      type: type,
                    );
                    await CategoryDB.instance.editCategory(category);
                    showToast(message: 'Edited');
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Done',
                    style: TextStyle(color: Color.fromARGB(255, 14, 31, 51)),
                  )),
            )
          ],
        ),
      );
    },
  );
}
// }
