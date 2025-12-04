// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num).toInt(),
      departmentId: (json['departmentId'] as num).toInt(),
      timeZoneGroupId: (json['timeZoneGroupId'] as num).toInt(),
      hired: nullableDateFromJson(json['hired'] as String?),
      releaseDate: nullableDateFromJson(json['releaseDate'] as String?),
      email: json['email'] as String?,
      username: json['username'] as String?,
      active: json['active'] as bool,
      fullName: json['fullName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'departmentId': instance.departmentId,
      'timeZoneGroupId': instance.timeZoneGroupId,
      'hired': nullableDateToJson(instance.hired),
      'releaseDate': nullableDateToJson(instance.releaseDate),
      'email': instance.email,
      'username': instance.username,
      'active': instance.active,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
    };

UserAllowedActions _$UserAllowedActionsFromJson(Map<String, dynamic> json) =>
    UserAllowedActions(
      canSubmitTimetrack: json['canSubmitTimetrack'] as bool,
    );

Map<String, dynamic> _$UserAllowedActionsToJson(UserAllowedActions instance) =>
    <String, dynamic>{
      'canSubmitTimetrack': instance.canSubmitTimetrack,
    };

UserWithAllowedActions _$UserWithAllowedActionsFromJson(
        Map<String, dynamic> json) =>
    UserWithAllowedActions(
      id: (json['id'] as num).toInt(),
      departmentId: (json['departmentId'] as num).toInt(),
      timeZoneGroupId: (json['timeZoneGroupId'] as num).toInt(),
      active: json['active'] as bool,
      fullName: json['fullName'] as String,
      firstName: json['firstName'] as String,
      middleName: json['middleName'] as String,
      lastName: json['lastName'] as String,
      allowedActions: UserAllowedActions.fromJson(
          json['allowedActions'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserWithAllowedActionsToJson(
        UserWithAllowedActions instance) =>
    <String, dynamic>{
      'id': instance.id,
      'departmentId': instance.departmentId,
      'timeZoneGroupId': instance.timeZoneGroupId,
      'active': instance.active,
      'fullName': instance.fullName,
      'firstName': instance.firstName,
      'middleName': instance.middleName,
      'lastName': instance.lastName,
      'allowedActions': instance.allowedActions,
    };

UserList _$UserListFromJson(Map<String, dynamic> json) => UserList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map(
              (e) => UserWithAllowedActions.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserListToJson(UserList instance) => <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
    };

UserSchedule _$UserScheduleFromJson(Map<String, dynamic> json) => UserSchedule(
      dateFrom: dateFromJson(json['dateFrom'] as String),
      dateTo: dateFromJson(json['dateTo'] as String),
      schedule: UserSchedule._scheduleFromJson(json['schedule'] as List),
    );

Map<String, dynamic> _$UserScheduleToJson(UserSchedule instance) =>
    <String, dynamic>{
      'dateFrom': dateToJson(instance.dateFrom),
      'dateTo': dateToJson(instance.dateTo),
      'schedule': UserSchedule._scheduleToJson(instance.schedule),
    };
