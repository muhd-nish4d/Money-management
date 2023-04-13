import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/consts/container_shadow.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import '../../blocs/category/category_bloc.dart';
import '../../consts/color.dart';
import '../../models/category/category_model.dart';
import '../../widgets/category/delete_edit_bottum_sheet.dart';

class ScreenExpense extends StatelessWidget {
  const ScreenExpense({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // ValueListenableBuilder(
        // valueListenable: CategoryDB().expenseCategoryList,
        // builder: (BuildContext ctx, List<CategoryModel> expenseList, Widget? _) {
        //   return Padding(
        //     padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        //     child:
        BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial) {
          return Container();
        } else if (state is CategoryLoading) {
          return const CircularProgressIndicator();
        } else if (state is CategoryShow) {
          return state.expenseCategories.isEmpty
              ? const Center(
                  child: Text(
                  'No Data',
                  style: TextStyle(
                      color: greyWhite,
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ))
              : GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 1.6,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    final expense = state.expenseCategories[index];
                    return SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: backBlack),
                        onPressed: () {},
                        onLongPress: () {
                          deleteEditBottumSheet(context,
                              categoryID: expense.id,
                              categeryName: expense.name);
                        },
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              gradient: blueGreenGrad,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [containerShadow()]),
                          child: Center(
                            child: Text(
                              expense.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: backBlack),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.expenseCategories.length,
                );
        } else {
          return Container();
        }
      },
    );
    //   },
    // );
  }
}

//Yellow = fromARGB(255, 206, 164, 52)
//Dark blue = fromARGB(255, 14, 31, 51)
//Blue = fromARGB(255, 18, 41, 72)
//font = Inter
