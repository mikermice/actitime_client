// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workflow_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkflowStatus _$WorkflowStatusFromJson(Map<String, dynamic> json) =>
    WorkflowStatus(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      workflowType: $enumDecode(_$WorkflowTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$WorkflowStatusToJson(WorkflowStatus instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$WorkflowTypeEnumMap[instance.workflowType]!,
    };

const _$WorkflowTypeEnumMap = {
  WorkflowType.open: 'open',
  WorkflowType.completed: 'completed',
};

WorkflowStatusWithAllowedActions _$WorkflowStatusWithAllowedActionsFromJson(
        Map<String, dynamic> json) =>
    WorkflowStatusWithAllowedActions(
      allowedActions: AllowedActions.fromJson(
          json['allowedActions'] as Map<String, dynamic>),
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      workflowType: $enumDecode(_$WorkflowTypeEnumMap, json['type']),
    );

Map<String, dynamic> _$WorkflowStatusWithAllowedActionsToJson(
        WorkflowStatusWithAllowedActions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$WorkflowTypeEnumMap[instance.workflowType]!,
      'allowedActions': instance.allowedActions,
    };

WorkflowStatusList _$WorkflowStatusListFromJson(Map<String, dynamic> json) =>
    WorkflowStatusList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => WorkflowStatusWithAllowedActions.fromJson(
              e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WorkflowStatusListToJson(WorkflowStatusList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
    };
