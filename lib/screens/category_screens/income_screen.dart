import 'package:flutter/material.dart';
import 'package:tracker/widgets/delete_edit_bottum_sheet.dart';
import '../../db_functions/category/category_db_functions.dart';
import '../../models/category/category_model.dart';

class ScreenIncome extends StatelessWidget {
  const ScreenIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: CategoryDB().incomeCategoryList,
      builder: (BuildContext ctx, List<CategoryModel> incomeList, Widget? _) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, right: 20,top: 10),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1.6,
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                crossAxisCount: 2),
            itemBuilder: (context, index) {
              final income = incomeList[index];
              return SizedBox(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 206, 164, 52),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
                  ),
                  onPressed: (){},
                  onLongPress: (){
                    deleteEditBottumSheet(context,categoryID: income.id,categeryName: income.name);
                  },
                  child: Text(
                    income.name,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 18, 41, 72)),
                  ),
                ),
                );
            },
            itemCount: incomeList.length,
          ),
        );
      },
    );
  }
}
