// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActitimeProject _$ActitimeProjectFromJson(Map<String, dynamic> json) =>
    ActitimeProject(
      id: (json['id'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      customerName: json['customerName'] as String,
      name: json['name'] as String,
      archived: json['archived'] as bool,
      created: dateTimeFromJson((json['created'] as num).toInt()),
      description: json['description'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ActitimeProjectToJson(ActitimeProject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'name': instance.name,
      'archived': instance.archived,
      'created': dateTimeToJson(instance.created),
      'description': instance.description,
      'url': instance.url,
    };
