import './base.dart';
import './user.dart';
import './department.dart';
import './time_zone_group.dart';
import './item_list.dart';
import './utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'leave_time.g.dart';

enum LeaveTypeBalance {
  @JsonValue("None")
  none,
  @JsonValue("Sick")
  sick,
  @JsonValue("PTO")
  pto,
}

@JsonSerializable()
class LeaveType extends WithId {
  /// Name of leave type
  final String name;

  /// Which balance is affected by leave of this type
  final LeaveTypeBalance balance;

  /// True if this leave type is archived
  final bool archived;

  LeaveType(
      {required super.id,
      required this.name,
      required this.balance,
      required this.archived});

  factory LeaveType.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeToJson(this);
}

@JsonSerializable()
class LeaveTypeList extends ItemList {
  final List<LeaveType> items;

  LeaveTypeList(
      {required super.offset, required super.limit, required this.items});

  factory LeaveTypeList.fromJson(Map<String, dynamic> json) =>
      _$LeaveTypeListFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTypeListToJson(this);
}

@JsonSerializable()
class LeaveTimeRecord {
  /// Unique user identifier
  final int userId;

  /// Offset for dateFrom
  final int dayOffset;

  /// Leave date
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime date;

  /// Leave type identifier
  final int leaveTypeId;

  /// Duration of leave time
  @JsonKey(fromJson: durationFromMinutes, toJson: durationToMinutes)
  final Duration leaveTime;

  LeaveTimeRecord(
      {required this.userId,
      required this.dayOffset,
      required this.date,
      required this.leaveTypeId,
      required this.leaveTime});

  factory LeaveTimeRecord.fromJson(Map<String, dynamic> json) =>
      _$LeaveTimeRecordFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTimeRecordToJson(this);
}

@JsonSerializable()
class LeaveTimeList {
  /// Map of user id to user. Contains users referenced in data list.
  final Map<int, User>? users;

  /// Map of user department id to department object.
  /// Contains departments referenced in users referenced in data list.
  final Map<int, Department>? departments;

  final Map<int, TimeZoneGroup>? timeZoneGroups;

  /// Start date of returned data
  final DateTime dateFrom;

  /// End date of returned data
  final DateTime dateTo;

  ///  If not null, then only partial results were included to satisfy
  ///  'stopAfter' parameter - till date specified in 'dateTo'. To request more
  ///  you need to repeat your request from date specified in 'nextDateFrom' field.
  final DateTime? nextDateFrom;

  /// Map of id to leave type. Contains leave types referenced in data list
  final Map<int, LeaveType>? leaveTypes;

  /// List of user leave time records
  final List<LeaveTimeRecord> data;

  LeaveTimeList(
      {this.users,
      this.departments,
      this.timeZoneGroups,
      required this.dateFrom,
      required this.dateTo,
      this.nextDateFrom,
      this.leaveTypes,
      required this.data});

  factory LeaveTimeList.fromJson(Map<String, dynamic> json) =>
      _$LeaveTimeListFromJson(json);

  Map<String, dynamic> toJson() => _$LeaveTimeListToJson(this);
}
