import 'package:json_annotation/json_annotation.dart';
import './allowed_actions.dart';
import './base.dart';
import './item_list.dart';

part 'workflow_status.g.dart';

enum WorkflowType { open, completed }

@JsonSerializable()
class WorkflowStatus extends WithId {
  final String name;

  @JsonKey(name: "type")
  final WorkflowType workflowType;

  WorkflowStatus(
      {required super.id, required this.name, required this.workflowType});

  factory WorkflowStatus.fromJson(Map<String, dynamic> json) =>
      _$WorkflowStatusFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowStatusToJson(this);
}

@JsonSerializable()
class WorkflowStatusWithAllowedActions extends WorkflowStatus {
  final AllowedActions allowedActions;

  WorkflowStatusWithAllowedActions(
      {required this.allowedActions,
      required super.id,
      required super.name,
      required super.workflowType});

  factory WorkflowStatusWithAllowedActions.fromJson(
          Map<String, dynamic> json) =>
      _$WorkflowStatusWithAllowedActionsFromJson(json);

  @override
  Map<String, dynamic> toJson() =>
      _$WorkflowStatusWithAllowedActionsToJson(this);
}

@JsonSerializable()
class WorkflowStatusList extends ItemList {
  final List<WorkflowStatusWithAllowedActions> items;

  WorkflowStatusList(
      {required super.offset, required super.limit, required this.items});

  factory WorkflowStatusList.fromJson(Map<String, dynamic> json) =>
      _$WorkflowStatusListFromJson(json);

  Map<String, dynamic> toJson() => _$WorkflowStatusListToJson(this);
}
