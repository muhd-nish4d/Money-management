import 'package:flutter/material.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/widgets/category_edit_bottom_sheet.dart';
import 'package:tracker/widgets/toast.dart';

Future<void> deleteEditBottumSheet(BuildContext context,
    {required String categoryID, required String categeryName}) async {
  showModalBottomSheet(
    backgroundColor: const Color.fromARGB(255, 14, 31, 51),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(15),
      topRight: Radius.circular(15),
    )),
    context: (context),
    builder: (context) {
      return SizedBox(
        width: double.infinity,
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            //Edit button
            Container(
              width: MediaQuery.of(context).size.width * .7,
              height: 60,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 206, 164, 52),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pop();
                    showEditBottumSheet(context,
                        categoryName: categeryName, idCategory: categoryID);
                    //  Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.edit,
                      color: Color.fromARGB(255, 14, 31, 51)),
                  label: const Text(
                    'Edit',
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 31, 51),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            //Delete button
            Container(
              width: MediaQuery.of(context).size.width * .7,
              height: 60,
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 206, 164, 52),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              child: TextButton.icon(
                  onPressed: () async {
                    await CategoryDB.instance.deleteCategory(categoryID);
                    showToast(message: 'Deleted');
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.delete,
                      color: Color.fromARGB(255, 14, 31, 51)),
                  label: const Text(
                    'Delete',
                    style: TextStyle(
                        color: Color.fromARGB(255, 14, 31, 51),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      );
    },
  );
}
//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
