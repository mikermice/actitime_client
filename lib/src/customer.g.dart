// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'customer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Customer _$CustomerFromJson(Map<String, dynamic> json) => Customer(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      archived: json['archived'] as bool,
      created: dateTimeFromJson((json['created'] as num).toInt()),
      description: json['description'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CustomerToJson(Customer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'archived': instance.archived,
      'created': dateTimeToJson(instance.created),
      'description': instance.description,
      'url': instance.url,
    };

CustomerWithAllowedActions _$CustomerWithAllowedActionsFromJson(
        Map<String, dynamic> json) =>
    CustomerWithAllowedActions(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      archived: json['archived'] as bool,
      created: dateTimeFromJson((json['created'] as num).toInt()),
      url: json['url'] as String,
      allowedActions: AllowedActions.fromJson(
          json['allowedActions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CustomerWithAllowedActionsToJson(
        CustomerWithAllowedActions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'archived': instance.archived,
      'created': dateTimeToJson(instance.created),
      'url': instance.url,
      'allowedActions': instance.allowedActions,
    };

CustomerList _$CustomerListFromJson(Map<String, dynamic> json) => CustomerList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              CustomerWithAllowedActions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CustomerListToJson(CustomerList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
    };
