import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/blocs/category/category_bloc.dart';
import '../../consts/color.dart';
import '../../consts/container_shadow.dart';
// import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/widgets/category/category_edit_bottom_sheet.dart';
import 'package:tracker/consts/toast.dart';

List<String>? deleteCategoryId = [];

Future<void> deleteEditBottumSheet(BuildContext context,
    {required String categoryID, required String categeryName}) async {
  showModalBottomSheet(
    backgroundColor: backBlack,
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
              decoration: BoxDecoration(
                  gradient: blueGreenGrad,
                  color: const Color.fromARGB(255, 206, 164, 52),
                  boxShadow: [containerShadow()],
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
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
              decoration: BoxDecoration(
                  boxShadow: [containerShadow()],
                  gradient: blueGreenGrad,
                  color: const Color.fromARGB(255, 206, 164, 52),
                  borderRadius: const BorderRadius.all(Radius.circular(15))),
              child: TextButton.icon(
                  onPressed: () async {
                    // deleteCategoryId!.add(categoryID);
                    // print(deleteCategoryId);
                    BlocProvider.of<CategoryBloc>(context)
                        .add(CategoryDeleteEvent(id: categoryID));
                    /* After Bloc =============================================================
                    await CategoryDB.instance.deleteCategory(categoryID);
                    */
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
