// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ActitimeUser _$ActitimeUserFromJson(Map<String, dynamic> json) => ActitimeUser(
      id: (json['id'] as num).toInt(),
      departmentId: (json['departmentId'] as num).toInt(),
      timeZoneGroupId: (json['timeZoneGroupId'] as num).toInt(),
      active: json['active'] as bool,
      fullName: json['fullName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$ActitimeUserToJson(ActitimeUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departmentId': instance.departmentId,
      'timeZoneGroupId': instance.timeZoneGroupId,
      'active': instance.active,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
    };
