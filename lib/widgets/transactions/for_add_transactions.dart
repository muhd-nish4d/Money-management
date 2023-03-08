import 'package:flutter/material.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';

import '../../models/category/category_model.dart';
ValueNotifier<CategoryType> selectedCategoryTypeinAdd =
    ValueNotifier(CategoryType.income);

class RadioButtonWidgetforAdd extends StatelessWidget {
  final String title;
  final CategoryType type;
  const RadioButtonWidgetforAdd(
      {super.key, required this.title, required this.type});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ValueListenableBuilder(
          valueListenable: selectedCategoryTypeinAdd,
          builder: (context, newCategory, _) {
            return Radio<CategoryType>(
              fillColor: MaterialStateColor.resolveWith(
                (states) => const Color.fromARGB(255, 206, 164, 52),
              ),
              value: type,
              groupValue: newCategory,
              onChanged: (value) {
                if (value == null) {
                  return;
                }
                selectedCategoryTypeinAdd.value = value;
                selectedCategoryTypeinAdd.notifyListeners();
              },
            );
          },
        ),
        Text(
          title,
          style: const TextStyle(
              color: Color.fromARGB(255, 206, 164, 52), fontSize: 18),
        )
      ],
    );
  }
}

Future<void> showCategoryAddPopupInTrans(BuildContext context) async {
  final categoryNameController = TextEditingController();
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 18, 41, 72),
        title: Row(
          children:const [
             RadioButtonWidgetforAdd(title: 'Income', type: CategoryType.income),
             RadioButtonWidgetforAdd(
                title: 'Expense', type: CategoryType.expense)
          ],
        ),
        content: SizedBox(
            height: 70,
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              controller: categoryNameController,
              style: const TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
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
            )),
        actions: [
          TextButton(
              onPressed: () {
                final categoryType = selectedCategoryTypeinAdd.value;
                final categoryName = categoryNameController.text;
                if (categoryName.isEmpty) {
                  return;
                }
                final category = CategoryModel(
                    id: DateTime.now().microsecondsSinceEpoch.toString(),
                    name: categoryName,
                    type: categoryType);
                    CategoryDB.instance.insertCategory(category);
                Navigator.of(context).pop();
              },
              child: const Text(
                'Done',
                style: TextStyle(color: Color.fromARGB(255, 206, 164, 52)),
              ))
        ],
      );
    },
  );
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
