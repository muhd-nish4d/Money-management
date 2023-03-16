import 'package:hive_flutter/hive_flutter.dart';
part 'grid_list_view.g.dart';
@HiveType(typeId: 4)
class SearchShowBtn {
  @HiveField(0)
  final bool gridListBtn;

  SearchShowBtn({this.gridListBtn = false});
}