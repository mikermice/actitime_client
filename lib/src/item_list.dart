import 'package:json_annotation/json_annotation.dart';

part 'item_list.g.dart';

@JsonSerializable()
class ItemList {
  final int offset;
  final int limit;
  final List<Map<String, dynamic>> items;

  ItemList({required this.offset, required this.limit, required this.items});

  factory ItemList.fromJson(Map<String, dynamic> json) =>
      _$ItemListFromJson(json);

  Map<String, dynamic> toJson() => _$ItemListToJson(this);
}
