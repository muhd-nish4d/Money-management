part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();

  @override
  List<Object> get props => [];
}

//Initial Event
class CategoryInitialEvent extends CategoryEvent {}

//Add Event
class CategoryAddEvent extends CategoryEvent {
  final String id;
  final String name;
  final CategoryType type;

  const CategoryAddEvent(
      {required this.id, required this.name, required this.type});
}

//Edit Event
class CategoryEditEvent extends CategoryEvent {
  final String id;
  final String name;
  final CategoryType type;

  const CategoryEditEvent(
      {required this.id, required this.name, required this.type});
}

//Delete Event
class CategoryDeleteEvent extends CategoryEvent {
  final String id;

  const CategoryDeleteEvent({required this.id});
}
