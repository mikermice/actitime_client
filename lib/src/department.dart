import 'package:json_annotation/json_annotation.dart';
import './base.dart';
import './item_list.dart';

part 'department.g.dart';

@JsonSerializable()
class Department extends WithId {
  /// Department name
  final String name;

  /// Wheather this is the default department
  @JsonKey(name: "default")
  final bool isDefault;

  Department({required super.id, required this.name, required this.isDefault});

  factory Department.fromJson(Map<String, dynamic> json) =>
      _$DepartmentFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentToJson(this);
}

@JsonSerializable()
class DepartmentList extends ItemList {
  final List<Department> items;

  DepartmentList(
      {required super.offset, required super.limit, required this.items});

  factory DepartmentList.fromJson(Map<String, dynamic> json) =>
      _$DepartmentListFromJson(json);

  Map<String, dynamic> toJson() => _$DepartmentListToJson(this);
}
