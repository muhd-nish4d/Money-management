import 'package:flutter/material.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import '../../models/category/category_model.dart';
import '../../widgets/delete_edit_bottum_sheet.dart';

class ScreenExpense extends StatelessWidget {
  const ScreenExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().expenseCategoryList,
      builder: (BuildContext ctx, List<CategoryModel> expenseList, Widget? _) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.6,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final expense = expenseList[index];
              return SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: const Color.fromARGB(255, 206, 164, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  ),
                  onPressed: (){},
                  onLongPress: (){
                    deleteEditBottumSheet(context,categoryID: expense.id,categeryName: expense.name);
                  },
                  child: Text(
                    expense.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 18, 41, 72)),
                  ),
                ),
                );
            },
            itemCount: expenseList.length,
          ),
        );
      },
    );
  }
}


//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter