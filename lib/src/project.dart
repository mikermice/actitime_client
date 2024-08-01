import 'package:json_annotation/json_annotation.dart';

import './utils.dart';

part 'project.g.dart';

@JsonSerializable()
class ActitimeProject {
  final int id;
  final int customerId;
  final String customerName;
  final String name;
  final bool archived;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime created;
  final String description;
  final String url;

  ActitimeProject(
      {required this.id,
      required this.customerId,
      required this.customerName,
      required this.name,
      required this.archived,
      required this.created,
      required this.description,
      required this.url});

  factory ActitimeProject.fromJson(Map<String, dynamic> json) =>
      _$ActitimeProjectFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeProjectToJson(this);
}
