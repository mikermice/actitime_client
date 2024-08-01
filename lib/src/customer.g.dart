// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActitimeCustomer _$ActitimeCustomerFromJson(Map<String, dynamic> json) =>
    ActitimeCustomer(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      archived: json['archived'] as bool,
      created: dateTimeFromJson((json['created'] as num).toInt()),
      description: json['description'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ActitimeCustomerToJson(ActitimeCustomer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'archived': instance.archived,
      'created': dateTimeToJson(instance.created),
      'description': instance.description,
      'url': instance.url,
    };
