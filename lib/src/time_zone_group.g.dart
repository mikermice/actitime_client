// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_zone_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TimeZoneGroup _$TimeZoneGroupFromJson(Map<String, dynamic> json) =>
    TimeZoneGroup(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      timeZoneId: (json['timeZoneId'] as num).toInt(),
      isDefault: json['default'] as bool,
    );

Map<String, dynamic> _$TimeZoneGroupToJson(TimeZoneGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'timeZoneId': instance.timeZoneId,
      'default': instance.isDefault,
    };
