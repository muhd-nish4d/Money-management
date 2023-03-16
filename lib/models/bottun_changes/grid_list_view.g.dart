// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_list_view.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchShowBtnAdapter extends TypeAdapter<SearchShowBtn> {
  @override
  final int typeId = 4;

  @override
  SearchShowBtn read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchShowBtn(
      gridListBtn: fields[0] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SearchShowBtn obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.gridListBtn);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchShowBtnAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
