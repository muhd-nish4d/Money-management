import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/foundation.dart';
import 'package:tracker/db_functions/category/category_db_functions.dart';
import 'package:tracker/models/category/category_model.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryDBFunctions categoryDBFun;

  List<CategoryModel> categories = [];
  List<CategoryModel> incomeCategories = [];
  List<CategoryModel> expenseCategories = [];
  CategoryBloc(this.categoryDBFun) : super(CategoryInitial()) {
    on<CategoryInitialEvent>((event, emit) async {
      emit(CategoryLoading());
      await _getCategories();
      emit(CategoryShow(
          incomeCategories: incomeCategories,
          expenseCategories: expenseCategories));
    });
    on<CategoryAddEvent>((event, emit) async {
      emit(CategoryLoading());
      await _addCategory(name: event.name, type: event.type, id: event.id);
      // log(even)
      await _getCategories();
      emit(CategoryShow(
          incomeCategories: incomeCategories,
          expenseCategories: expenseCategories));
    });
    on<CategoryEditEvent>((event, emit) async {
      emit(CategoryLoading());
      await _editCategory(
          id: event.id.toString(), name: event.name, type: event.type);
      log(event.id.toString());
      await _getCategories();
      emit(CategoryShow(
          incomeCategories: incomeCategories,
          expenseCategories: expenseCategories));
    });
    on<CategoryDeleteEvent>((event, emit) async {
      emit(CategoryLoading());
      await _deleteCategory(categoryID: event.id);  
      await _getCategories();
      emit(CategoryShow(
          incomeCategories: incomeCategories,
          expenseCategories: expenseCategories));
    });
  }

  //Helping Functions
  Future<void> _getCategories() async {
    await categoryDBFun.getAllCategory().then((value) => categories = value);
    incomeCategories.clear();
    expenseCategories.clear();
    await Future.forEach(categories, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomeCategories.add(category);
      } else {
        expenseCategories.add(category);
      }
    });
  }

  Future<void> _addCategory(
      {required String id,
      required String name,
      required CategoryType type}) async {
    await categoryDBFun
        .addCategory(CategoryModel(id: id, name: name, type: type));
  }

  Future<void> _editCategory(
      {required String id,
      required String name,
      required CategoryType type}) async {
    await categoryDBFun
        .updateCategory(CategoryModel(name: name, type: type, id: id));
  }

  Future<void> _deleteCategory({required String categoryID}) async {
    await categoryDBFun.deleteCategory(categoryID);
    await _getCategories();
  }
}
