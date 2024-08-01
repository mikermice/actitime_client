// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActitimeTimeTrackRecord _$ActitimeTimeTrackRecordFromJson(
        Map<String, dynamic> json) =>
    ActitimeTimeTrackRecord(
      taskId: (json['taskId'] as num).toInt(),
      time: durationFromMinutes((json['time'] as num).toInt()),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ActitimeTimeTrackRecordToJson(
        ActitimeTimeTrackRecord instance) =>
    <String, dynamic>{
      'taskId': instance.taskId,
      'time': durationToMinutes(instance.time),
      'comment': instance.comment,
    };

ActitimeTimeTrackData _$ActitimeTimeTrackDataFromJson(
        Map<String, dynamic> json) =>
    ActitimeTimeTrackData(
      userId: (json['userId'] as num).toInt(),
      records: (json['records'] as List<dynamic>)
          .map((e) =>
              ActitimeTimeTrackRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
      approved: json['approved'] as bool?,
      dayOffset: (json['dayOffset'] as num).toInt(),
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$ActitimeTimeTrackDataToJson(
        ActitimeTimeTrackData instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'records': instance.records,
      'approved': instance.approved,
      'dayOffset': instance.dayOffset,
      'date': instance.date.toIso8601String(),
    };

ActitimeTimeTrack _$ActitimeTimeTrackFromJson(Map<String, dynamic> json) =>
    ActitimeTimeTrack(
      dateFrom: DateTime.parse(json['dateFrom'] as String),
      dateTo: DateTime.parse(json['dateTo'] as String),
      nextDateFrom: json['nextDateFrom'] == null
          ? null
          : DateTime.parse(json['nextDateFrom'] as String),
      data: (json['data'] as List<dynamic>)
          .map((e) => ActitimeTimeTrackData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ActitimeTimeTrackToJson(ActitimeTimeTrack instance) =>
    <String, dynamic>{
      'dateFrom': instance.dateFrom.toIso8601String(),
      'dateTo': instance.dateTo.toIso8601String(),
      'nextDateFrom': instance.nextDateFrom?.toIso8601String(),
      'data': instance.data,
    };
