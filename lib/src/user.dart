import 'package:json_annotation/json_annotation.dart';
import './base.dart';
import './item_list.dart';
import './utils.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends WithId {
  /// Unique identifier of user department
  final int departmentId;

  /// Unique identifier of user time zone group
  final int timeZoneGroupId;

  /// Hire date
  @JsonKey(fromJson: nullableDateFromJson, toJson: nullableDateToJson)
  final DateTime? hired;

  /// Release date
  @JsonKey(fromJson: nullableDateFromJson, toJson: nullableDateToJson)
  final DateTime? releaseDate;

  /// User's email
  final String? email;

  /// User's unique username
  final String? username;

  /// Wheather this user is active
  final bool active;

  /// Fullname: firstName + middleName + lastName
  final String fullName;

  /// User's first name
  final String firstName;

  /// User's middle name
  final String middleName;

  /// User's last  name
  final String lastName;

  User(
      {required super.id,
      required this.departmentId,
      required this.timeZoneGroupId,
      this.hired,
      this.releaseDate,
      this.email,
      this.username,
      required this.active,
      required this.fullName,
      required this.firstName,
      required this.middleName,
      required this.lastName});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}

@JsonSerializable()
class UserAllowedActions {
  final bool canSubmitTimetrack;

  UserAllowedActions({required this.canSubmitTimetrack});

  factory UserAllowedActions.fromJson(Map<String, dynamic> json) =>
      _$UserAllowedActionsFromJson(json);

  Map<String, dynamic> toJson() => _$UserAllowedActionsToJson(this);
}

@JsonSerializable()
class UserWithAllowedActions extends User {
  final UserAllowedActions allowedActions;

  UserWithAllowedActions(
      {required super.id,
      required super.departmentId,
      required super.timeZoneGroupId,
      required super.active,
      required super.fullName,
      required super.firstName,
      required super.middleName,
      required super.lastName,
      required this.allowedActions});

  factory UserWithAllowedActions.fromJson(Map<String, dynamic> json) =>
      _$UserWithAllowedActionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$UserWithAllowedActionsToJson(this);
}

@JsonSerializable()
class UserList extends ItemList {
  final List<UserWithAllowedActions> items;

  UserList({required super.offset, required super.limit, required this.items});

  factory UserList.fromJson(Map<String, dynamic> json) =>
      _$UserListFromJson(json);

  Map<String, dynamic> toJson() => _$UserListToJson(this);
}

@JsonSerializable()
class UserSchedule {
  /// Date the schedule returned from, inclusive.
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime dateFrom;

  /// Date the schedule returned to, inclusive.
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime dateTo;

  /// List of workday durations, where the first element corresponds to 'dateFrom' and the last to 'dateTo'.
  @JsonKey(fromJson: _scheduleFromJson, toJson: _scheduleToJson)
  final List<Duration> schedule;

  const UserSchedule(
      {required this.dateFrom, required this.dateTo, required this.schedule});

  factory UserSchedule.fromJson(Map<String, dynamic> json) =>
      _$UserScheduleFromJson(json);

  Map<String, dynamic> toJson() => _$UserScheduleToJson(this);

  static List<int> _scheduleToJson(List<Duration> schedule) =>
      schedule.map((duration) => durationToMinutes(duration)).toList();

  static List<Duration> _scheduleFromJson(List<dynamic> json) =>
      json.map((js) => durationFromMinutes(js as int)).toList();
}
