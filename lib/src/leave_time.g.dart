// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'leave_time.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LeaveType _$LeaveTypeFromJson(Map<String, dynamic> json) => LeaveType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      balance: $enumDecode(_$LeaveTypeBalanceEnumMap, json['balance']),
      archived: json['archived'] as bool,
    );

Map<String, dynamic> _$LeaveTypeToJson(LeaveType instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'balance': _$LeaveTypeBalanceEnumMap[instance.balance]!,
      'archived': instance.archived,
    };

const _$LeaveTypeBalanceEnumMap = {
  LeaveTypeBalance.none: 'None',
  LeaveTypeBalance.sick: 'Sick',
  LeaveTypeBalance.pto: 'PTO',
};

LeaveTypeList _$LeaveTypeListFromJson(Map<String, dynamic> json) =>
    LeaveTypeList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => LeaveType.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaveTypeListToJson(LeaveTypeList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
    };

LeaveTimeRecord _$LeaveTimeRecordFromJson(Map<String, dynamic> json) =>
    LeaveTimeRecord(
      userId: (json['userId'] as num).toInt(),
      dayOffset: (json['dayOffset'] as num).toInt(),
      date: dateFromJson(json['date'] as String),
      leaveTypeId: (json['leaveTypeId'] as num).toInt(),
      leaveTime: durationFromMinutes((json['leaveTime'] as num).toInt()),
    );

Map<String, dynamic> _$LeaveTimeRecordToJson(LeaveTimeRecord instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'dayOffset': instance.dayOffset,
      'date': dateToJson(instance.date),
      'leaveTypeId': instance.leaveTypeId,
      'leaveTime': durationToMinutes(instance.leaveTime),
    };

LeaveTimeList _$LeaveTimeListFromJson(Map<String, dynamic> json) =>
    LeaveTimeList(
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(int.parse(k), User.fromJson(e as Map<String, dynamic>)),
      ),
      departments: (json['departments'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), Department.fromJson(e as Map<String, dynamic>)),
      ),
      timeZoneGroups: (json['timeZoneGroups'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), TimeZoneGroup.fromJson(e as Map<String, dynamic>)),
      ),
      dateFrom: DateTime.parse(json['dateFrom'] as String),
      dateTo: DateTime.parse(json['dateTo'] as String),
      nextDateFrom: json['nextDateFrom'] == null
          ? null
          : DateTime.parse(json['nextDateFrom'] as String),
      leaveTypes: (json['leaveTypes'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            int.parse(k), LeaveType.fromJson(e as Map<String, dynamic>)),
      ),
      data: (json['data'] as List<dynamic>)
          .map((e) => LeaveTimeRecord.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LeaveTimeListToJson(LeaveTimeList instance) =>
    <String, dynamic>{
      'users': instance.users?.map((k, e) => MapEntry(k.toString(), e)),
      'departments':
          instance.departments?.map((k, e) => MapEntry(k.toString(), e)),
      'timeZoneGroups':
          instance.timeZoneGroups?.map((k, e) => MapEntry(k.toString(), e)),
      'dateFrom': instance.dateFrom.toIso8601String(),
      'dateTo': instance.dateTo.toIso8601String(),
      'nextDateFrom': instance.nextDateFrom?.toIso8601String(),
      'leaveTypes':
          instance.leaveTypes?.map((k, e) => MapEntry(k.toString(), e)),
      'data': instance.data,
    };
