// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeTrackRecord _$TimeTrackRecordFromJson(Map<String, dynamic> json) =>
    TimeTrackRecord(
      taskId: (json['taskId'] as num).toInt(),
      time: durationFromMinutes((json['time'] as num).toInt()),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$TimeTrackRecordToJson(TimeTrackRecord instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'time': durationToMinutes(instance.time),
      'comment': instance.comment,
    };

UserDayTTDataWithDayOffset _$UserDayTTDataWithDayOffsetFromJson(
        Map<String, dynamic> json) =>
    UserDayTTDataWithDayOffset(
      userId: (json['userId'] as num).toInt(),
      records: (json['records'] as List<dynamic>)
          .map((e) => TimeTrackRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      approved: json['approved'] as bool?,
      dayOffset: (json['dayOffset'] as num).toInt(),
      date: dateFromJson(json['date'] as String),
    );

Map<String, dynamic> _$UserDayTTDataWithDayOffsetToJson(
        UserDayTTDataWithDayOffset instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'records': instance.records,
      'approved': instance.approved,
      'dayOffset': instance.dayOffset,
      'date': dateToJson(instance.date),
    };

TimeTrackList _$TimeTrackListFromJson(Map<String, dynamic> json) =>
    TimeTrackList(
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(int.parse(k), User.fromJson(e as Map<String, dynamic>)),
      ),
      departments: (json['departments'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), Department.fromJson(e as Map<String, dynamic>)),
      ),
      timeZoneGroup: (json['timeZoneGroup'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), TimeZoneGroup.fromJson(e as Map<String, dynamic>)),
      ),
      dateFrom: dateFromJson(json['dateFrom'] as String),
      dateTo: dateFromJson(json['dateTo'] as String),
      nextDateFrom: nullableDateFromJson(json['nextDateFrom'] as String?),
      customers: (json['customers'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), Customer.fromJson(e as Map<String, dynamic>)),
      ),
      projects: (json['projects'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(int.parse(k), Project.fromJson(e as Map<String, dynamic>)),
      ),
      tasks: (json['tasks'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(int.parse(k), Task.fromJson(e as Map<String, dynamic>)),
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
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              UserDayTTDataWithDayOffset.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TimeTrackListToJson(TimeTrackList instance) =>
    <String, dynamic>{
      'users': instance.users?.map((k, e) => MapEntry(k.toString(), e)),
      'departments':
          instance.departments?.map((k, e) => MapEntry(k.toString(), e)),
      'timeZoneGroup':
          instance.timeZoneGroup?.map((k, e) => MapEntry(k.toString(), e)),
      'dateFrom': dateToJson(instance.dateFrom),
      'dateTo': dateToJson(instance.dateTo),
      'nextDateFrom': nullableDateToJson(instance.nextDateFrom),
      'customers': instance.customers?.map((k, e) => MapEntry(k.toString(), e)),
      'projects': instance.projects?.map((k, e) => MapEntry(k.toString(), e)),
      'tasks': instance.tasks?.map((k, e) => MapEntry(k.toString(), e)),
      'typesOfWork':
          instance.typesOfWork?.map((k, e) => MapEntry(k.toString(), e)),
      'workflowStatuses':
          instance.workflowStatuses?.map((k, e) => MapEntry(k.toString(), e)),
      'data': instance.data,
    };
