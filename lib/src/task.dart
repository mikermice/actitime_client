import 'package:json_annotation/json_annotation.dart';
import './allowed_actions.dart';
import './base.dart';
import './customer.dart';
import './item_list.dart';
import './project.dart';
import './type_of_work.dart';
import './workflow_status.dart';
import './utils.dart';

part 'task.g.dart';

enum TaskStatus { open, completed }

@JsonSerializable()
class Task extends WithId {
  final String name;

  final String? description;

  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime created;

  final TaskStatus status;

  final int workflowStatusId;

  final int typeOfWorkId;

  final String url;

  final String projectName;

  final String customerName;

  final String workflowStatusName;

  final String typeOfWorkName;

  @JsonKey(fromJson: nullableDateTimeFromJson, toJson: nullableDateTimeToJson)
  final DateTime? deadline;

  @JsonKey(
      fromJson: nullableDurationFromMinutes, toJson: nullableDurationToMinutes)
  final Duration? estimatedTime;

  final int customerId;

  final int projectId;

  Task(
      {required super.id,
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

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@JsonSerializable()
class TaskWithAllowedActions extends Task {
  final AllowedActions allowedActions;

  TaskWithAllowedActions(
      {required super.id,
      required super.name,
      required super.description,
      required super.created,
      required super.customerId,
      required super.customerName,
      required super.projectId,
      required super.projectName,
      required super.status,
      required super.workflowStatusId,
      required super.workflowStatusName,
      required super.typeOfWorkId,
      required super.typeOfWorkName,
      required super.url,
      required this.allowedActions});

  factory TaskWithAllowedActions.fromJson(Map<String, dynamic> json) =>
      _$TaskWithAllowedActionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$TaskWithAllowedActionsToJson(this);
}

@JsonSerializable()
class TaskList extends ItemList {
  final List<TaskWithAllowedActions> items;
  final Map<int, Customer>? customers;
  final Map<int, Project>? projects;
  final Map<int, TypeOfWork>? typesOfWork;
  final Map<int, WorkflowStatus>? workflowStatuses;

  TaskList(
      {required super.offset,
      required super.limit,
      required this.items,
      required this.customers,
      required this.projects,
      required this.typesOfWork,
      required this.workflowStatuses});

  factory TaskList.fromJson(Map<String, dynamic> json) =>
      _$TaskListFromJson(json);

  Map<String, dynamic> toJson() => _$TaskListToJson(this);
}
