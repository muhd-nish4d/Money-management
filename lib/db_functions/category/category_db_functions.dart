import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../models/category/category_model.dart';

const categoryDBName = 'categoryDBName';

abstract class CategoryDBFunctions {
  Future<List<CategoryModel>> getCategories();
  Future<void> insertCategory(CategoryModel value);
  Future<void> deleteCategory(String categoryID);
  Future<void> editCategory(CategoryModel value);
  Future<void> categoryClear();
}

class CategoryDB implements CategoryDBFunctions {

  CategoryDB._internel();
  static CategoryDB instance = CategoryDB._internel();
  factory CategoryDB(){
    return instance;
  }

  ValueNotifier<List<CategoryModel>> incomeCategoryList = ValueNotifier([]);
  ValueNotifier<List<CategoryModel>> expenseCategoryList = ValueNotifier([]);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    return categoryDB.values.toList();
  }

  @override
  Future<void> insertCategory(CategoryModel value) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await categoryDB.put(value.id, value);
    refreshUI();
  }

  Future<void> refreshUI() async {
    final allCategories = await getCategories();
    incomeCategoryList.value.clear();
    expenseCategoryList.value.clear();
    await Future.forEach(allCategories, (CategoryModel category) {
      if (category.type == CategoryType.income) {
        incomeCategoryList.value.add(category);
      } else {
        expenseCategoryList.value.add(category);
      }
    });
    incomeCategoryList.notifyListeners();
    expenseCategoryList.notifyListeners();
  }
  
  @override
  Future<void> deleteCategory(String categoryID) async {
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await categoryDB.delete(categoryID);
    refreshUI();
  }
  
  @override
  Future<void> editCategory(CategoryModel value) async{
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await categoryDB.put(value.id, value);
    refreshUI();    
  }
  
  @override
  Future<void> categoryClear() async{
    final categoryDB = await Hive.openBox<CategoryModel>(categoryDBName);
    await categoryDB.clear();
    refreshUI();
  }
}
