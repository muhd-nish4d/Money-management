part of 'category_bloc.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryEdit extends CategoryState {
  final List<CategoryModel> categories;

  const CategoryEdit({required this.categories});
}

class CategoryShow extends CategoryState {
  final List<CategoryModel> incomeCategories;
  final List<CategoryModel> expenseCategories;

  const CategoryShow(
      {required this.incomeCategories, required this.expenseCategories});
}
