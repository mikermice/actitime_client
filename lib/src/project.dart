import 'package:json_annotation/json_annotation.dart';
import './allowed_actions.dart';
import './base.dart';
import './customer.dart';
import './item_list.dart';
import './utils.dart';

part 'project.g.dart';

@JsonSerializable()
class Project extends WithId {
  final int customerId;
  final String name;
  final bool archived;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime created;
  final String url;
  final String customerName;
  final String? description;

  Project(
      {required super.id,
      required this.customerId,
      required this.customerName,
      required this.name,
      required this.archived,
      required this.created,
      this.description,
      required this.url});

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

@JsonSerializable()
class ProjectWithAllowedActions extends Project {
  final AllowedActions allowedActions;

  ProjectWithAllowedActions(
      {required super.id,
      required super.customerId,
      required super.customerName,
      required super.name,
      required super.archived,
      required super.created,
      required super.url,
      required this.allowedActions});

  factory ProjectWithAllowedActions.fromJson(Map<String, dynamic> json) =>
      _$ProjectWithAllowedActionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProjectWithAllowedActionsToJson(this);
}

@JsonSerializable()
class ProjectList extends ItemList {
  final List<ProjectWithAllowedActions> items;
  final Map<int, Customer>? customers;

  ProjectList(
      {required super.offset,
      required super.limit,
      required this.items,
      this.customers});

  factory ProjectList.fromJson(Map<String, dynamic> json) =>
      _$ProjectListFromJson(json);

  Map<String, dynamic> toJson() => _$ProjectListToJson(this);
}
