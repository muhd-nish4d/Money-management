import 'package:hive_flutter/hive_flutter.dart';
import '../category/category_model.dart';
part 'transactions_model.g.dart';

@HiveType(typeId: 3)
class TransactionModel {
  @HiveField(0)
  final double amount;
  @HiveField(1)
  final DateTime date;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final CategoryType type;
  @HiveField(4)
  final CategoryModel category;
  @HiveField(5)
  String? id;

  TransactionModel({
    required this.id,
    required this.amount,
    required this.date,
    required this.note,
    required this.type,
    required this.category,
  });
}