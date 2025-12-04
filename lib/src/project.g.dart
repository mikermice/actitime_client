// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: (json['id'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      customerName: json['customerName'] as String,
      name: json['name'] as String,
      archived: json['archived'] as bool,
      created: dateTimeFromJson((json['created'] as num).toInt()),
      description: json['description'] as String?,
      url: json['url'] as String,
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'archived': instance.archived,
      'created': dateTimeToJson(instance.created),
      'url': instance.url,
      'customerName': instance.customerName,
      'description': instance.description,
    };

ProjectWithAllowedActions _$ProjectWithAllowedActionsFromJson(
        Map<String, dynamic> json) =>
    ProjectWithAllowedActions(
      id: (json['id'] as num).toInt(),
      customerId: (json['customerId'] as num).toInt(),
      customerName: json['customerName'] as String,
      name: json['name'] as String,
      archived: json['archived'] as bool,
      created: dateTimeFromJson((json['created'] as num).toInt()),
      url: json['url'] as String,
      allowedActions: AllowedActions.fromJson(
          json['allowedActions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProjectWithAllowedActionsToJson(
        ProjectWithAllowedActions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'customerId': instance.customerId,
      'name': instance.name,
      'archived': instance.archived,
      'created': dateTimeToJson(instance.created),
      'url': instance.url,
      'customerName': instance.customerName,
      'allowedActions': instance.allowedActions,
    };

ProjectList _$ProjectListFromJson(Map<String, dynamic> json) => ProjectList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) =>
              ProjectWithAllowedActions.fromJson(e as Map<String, dynamic>))
          .toList(),
      customers: (json['customers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), Customer.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$ProjectListToJson(ProjectList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
      'customers': instance.customers?.map((k, e) => MapEntry(k.toString(), e)),
    };
