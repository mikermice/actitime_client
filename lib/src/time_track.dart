import 'package:json_annotation/json_annotation.dart';
import './utils.dart';
import './department.dart';
import './time_zone_group.dart';
import './type_of_work.dart';
import './workflow_status.dart';
import './user.dart';
import './customer.dart';
import './project.dart';
import './task.dart';

part 'time_track.g.dart';

@JsonSerializable()
class TimeTrackRecord {
  /// Identifier of task the time is tracked for
  final int taskId;

  /// Tracked time
  @JsonKey(fromJson: durationFromMinutes, toJson: durationToMinutes)
  final Duration time;

  /// Optional comment for time-track record
  final String? comment;

  TimeTrackRecord({required this.taskId, required this.time, this.comment});

  factory TimeTrackRecord.fromJson(Map<String, dynamic> json) =>
      _$TimeTrackRecordFromJson(json);

  Map<String, dynamic> toJson() => _$TimeTrackRecordToJson(this);
}

/// Contains tracked time for specified user and date. Date is defined as
/// offset from 'dateFrom' field of wrapping object
@JsonSerializable()
class UserDayTTDataWithDayOffset {
  /// Identifier of user that tracked time
  final int userId;

  /// List of time-track records for day
  final List<TimeTrackRecord> records;

  /// Approval status of the day
  final bool? approved;

  /// Offset in days from 'dateFrom' field of wrapping object
  final int dayOffset;

  /// Time track date
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime date;

  UserDayTTDataWithDayOffset(
      {required this.userId,
      required this.records,
      this.approved,
      required this.dayOffset,
      required this.date});

  factory UserDayTTDataWithDayOffset.fromJson(Map<String, dynamic> json) =>
      _$UserDayTTDataWithDayOffsetFromJson(json);

  Map<String, dynamic> toJson() => _$UserDayTTDataWithDayOffsetToJson(this);
}

/// Result of time-track request
@JsonSerializable()
class TimeTrackList {
  /// Map of user id to user object. Contains users referenced in data list
  final Map<int, User>? users;

  /// Map of user department id to department object. Contains departments
  /// referenced in users referenced in data list
  final Map<int, Department>? departments;

  /// Map of user time zone id to user time zone object. Contains user time
  /// zone referenced in users referenced in data list
  final Map<int, TimeZoneGroup>? timeZoneGroup;

  /// Start date of returned data
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime dateFrom;

  /// End date of returned data. Note that this one may be smaller than
  /// requested in parameters"""
  @JsonKey(fromJson: dateFromJson, toJson: dateToJson)
  final DateTime dateTo;

  /// If not null, then only partial results were included to satisfy
  /// 'stopAfter' parameter - till date specified in 'dateTo'. To request more
  /// you need to repeat your request from date specified in 'nextDateFrom'
  /// field.
  @JsonKey(fromJson: nullableDateFromJson, toJson: nullableDateToJson)
  final DateTime? nextDateFrom;

  /// Map of customer id to customer object. Contains customers referenced in
  /// data list
  final Map<int, Customer>? customers;

  /// Map of project id to project object. Contains projects referenced in data
  /// list
  final Map<int, Project>? projects;

  /// Map of task id to task object. Contains tasks referenced in data list
  final Map<int, Task>? tasks;

  /// Map of type of work id to type of work object. Contains types of work
  /// referenced in tasks referenced in data list
  final Map<int, TypeOfWork>? typesOfWork;

  /// Map of workflow status id to workflow status object. Contains workflow
  /// status objects referenced in tasks referenced in data list
  final Map<int, WorkflowStatus>? workflowStatuses;

  /// List of time track records per user per day
  final List<UserDayTTDataWithDayOffset> data;

  TimeTrackList(
      {required this.users,
      required this.departments,
      required this.timeZoneGroup,
      required this.dateFrom,
      required this.dateTo,
      required this.nextDateFrom,
      required this.customers,
      required this.projects,
      required this.tasks,
      required this.typesOfWork,
      required this.workflowStatuses,
      required this.data});

  factory TimeTrackList.fromJson(Map<String, dynamic> json) =>
      _$TimeTrackListFromJson(json);

  Map<String, dynamic> toJson() => _$TimeTrackListToJson(this);
}
