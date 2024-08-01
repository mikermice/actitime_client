// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActitimeTask _$ActitimeTaskFromJson(Map<String, dynamic> json) => ActitimeTask(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String,
      created: dateTimeFromJson((json['created'] as num).toInt()),
      customerId: (json['customerId'] as num).toInt(),
      customerName: json['customerName'] as String,
      projectId: (json['projectId'] as num).toInt(),
      projectName: json['projectName'] as String,
      status: $enumDecode(_$TaskStatusEnumMap, json['status']),
      workflowStatusId: (json['workflowStatusId'] as num).toInt(),
      workflowStatusName: json['workflowStatusName'] as String,
      typeOfWorkId: (json['typeOfWorkId'] as num).toInt(),
      typeOfWorkName: json['typeOfWorkName'] as String,
      deadline: nullableDateTimeFromJson((json['deadline'] as num?)?.toInt()),
      estimatedTime:
          nullableDurationFromMinutes((json['estimatedTime'] as num?)?.toInt()),
      url: json['url'] as String,
    );

Map<String, dynamic> _$ActitimeTaskToJson(ActitimeTask instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created': dateTimeToJson(instance.created),
      'customerId': instance.customerId,
      'customerName': instance.customerName,
      'projectId': instance.projectId,
      'projectName': instance.projectName,
      'status': _$TaskStatusEnumMap[instance.status]!,
      'workflowStatusId': instance.workflowStatusId,
      'workflowStatusName': instance.workflowStatusName,
      'typeOfWorkId': instance.typeOfWorkId,
      'typeOfWorkName': instance.typeOfWorkName,
      'deadline': nullableDateTimeToJson(instance.deadline),
      'estimatedTime': nullableDurationToMinutes(instance.estimatedTime),
      'url': instance.url,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.open: 'open',
  TaskStatus.completed: 'completed',
};
