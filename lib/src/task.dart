import 'package:json_annotation/json_annotation.dart';
import './utils.dart';

part 'task.g.dart';

enum TaskStatus { open, completed }

@JsonSerializable()
class ActitimeTask {
  final int id;
  final String name;
  final String description;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime created;
  final int customerId;
  final String customerName;
  final int projectId;
  final String projectName;
  final TaskStatus status;
  final int workflowStatusId;
  final String workflowStatusName;
  final int typeOfWorkId;
  final String typeOfWorkName;
  @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
  final DateTime? deadline;
  @JsonKey(
      fromJson: nullableDurationFromMinutes, toJson: nullableDurationToMinutes)
  final Duration? estimatedTime;
  final String url;

  ActitimeTask(
      {required this.id,
      required this.name,
      required this.description,
      required this.created,
      required this.customerId,
      required this.customerName,
      required this.projectId,
      required this.projectName,
      required this.status,
      required this.workflowStatusId,
      required this.workflowStatusName,
      required this.typeOfWorkId,
      required this.typeOfWorkName,
      this.deadline,
      this.estimatedTime,
      required this.url});

  factory ActitimeTask.fromJson(Map<String, dynamic> json) =>
      _$ActitimeTaskFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeTaskToJson(this);
}
