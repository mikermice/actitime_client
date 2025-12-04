// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) => Task(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
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

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created': dateTimeToJson(instance.created),
      'status': _$TaskStatusEnumMap[instance.status]!,
      'workflowStatusId': instance.workflowStatusId,
      'typeOfWorkId': instance.typeOfWorkId,
      'url': instance.url,
      'projectName': instance.projectName,
      'customerName': instance.customerName,
      'workflowStatusName': instance.workflowStatusName,
      'typeOfWorkName': instance.typeOfWorkName,
      'deadline': nullableDateTimeToJson(instance.deadline),
      'estimatedTime': nullableDurationToMinutes(instance.estimatedTime),
      'customerId': instance.customerId,
      'projectId': instance.projectId,
    };

const _$TaskStatusEnumMap = {
  TaskStatus.open: 'open',
  TaskStatus.completed: 'completed',
};

TaskWithAllowedActions _$TaskWithAllowedActionsFromJson(
        Map<String, dynamic> json) =>
    TaskWithAllowedActions(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
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
      url: json['url'] as String,
      allowedActions: AllowedActions.fromJson(
          json['allowedActions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TaskWithAllowedActionsToJson(
        TaskWithAllowedActions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'created': dateTimeToJson(instance.created),
      'status': _$TaskStatusEnumMap[instance.status]!,
      'workflowStatusId': instance.workflowStatusId,
      'typeOfWorkId': instance.typeOfWorkId,
      'url': instance.url,
      'projectName': instance.projectName,
      'customerName': instance.customerName,
      'workflowStatusName': instance.workflowStatusName,
      'typeOfWorkName': instance.typeOfWorkName,
      'customerId': instance.customerId,
      'projectId': instance.projectId,
      'allowedActions': instance.allowedActions,
    };

TaskList _$TaskListFromJson(Map<String, dynamic> json) => TaskList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map(
              (e) => TaskWithAllowedActions.fromJson(e as Map<String, dynamic>))
          .toList(),
      customers: (json['customers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), Customer.fromJson(e as Map<String, dynamic>)),
      ),
      projects: (json['projects'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(int.parse(k), Project.fromJson(e as Map<String, dynamic>)),
      ),
      typesOfWork: (json['typesOfWork'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), TypeOfWork.fromJson(e as Map<String, dynamic>)),
      ),
      workflowStatuses:
          (json['workflowStatuses'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), WorkflowStatus.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$TaskListToJson(TaskList instance) => <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
      'customers': instance.customers?.map((k, e) => MapEntry(k.toString(), e)),
      'projects': instance.projects?.map((k, e) => MapEntry(k.toString(), e)),
      'typesOfWork':
          instance.typesOfWork?.map((k, e) => MapEntry(k.toString(), e)),
      'workflowStatuses':
          instance.workflowStatuses?.map((k, e) => MapEntry(k.toString(), e)),
    };
