// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Department _$DepartmentFromJson(Map<String, dynamic> json) => Department(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isDefault: json['default'] as bool,
    );

Map<String, dynamic> _$DepartmentToJson(Department instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'default': instance.isDefault,
    };

DepartmentList _$DepartmentListFromJson(Map<String, dynamic> json) =>
    DepartmentList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Department.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DepartmentListToJson(DepartmentList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
    };
