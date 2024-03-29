import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tracker/widgets/category/delete_edit_bottum_sheet.dart';
import '../../blocs/category/category_bloc.dart';
import '../../consts/color.dart';
import '../../consts/container_shadow.dart';
// import '../../db_functions/category/category_db_functions.dart';
// import '../../models/category/category_model.dart';

class ScreenIncome extends StatelessWidget {
  const ScreenIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return
        // ValueListenableBuilder(
        // valueListenable: CategoryDB().incomeCategoryList,
        // builder: (BuildContext ctx, List<CategoryModel> incomeList, Widget? _) {
        //   return Padding(
        //     padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
        //     child:
        BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial) {
          return Container();
        } else if (state is CategoryShow) {
          return state.incomeCategories.isEmpty
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
                    final income = state.incomeCategories[index];
                    return SizedBox(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: backBlack,
                        ),
                        onPressed: () {},
                        onLongPress: () {
                          deleteEditBottumSheet(context,
                              categoryID: income.id, categeryName: income.name);
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
                              income.name,
                              style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 18, 41, 72)),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: state.incomeCategories.length,
                );
        } else if (state is CategoryLoading) {
          return const Center(
              child: CircularProgressIndicator(
            strokeWidth: 2,
          ));
        } else {
          return Container();
        }
      },
    );
    // },
  }
}
