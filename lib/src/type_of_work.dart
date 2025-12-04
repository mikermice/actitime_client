import 'package:json_annotation/json_annotation.dart';
import './base.dart';

part 'type_of_work.g.dart';

@JsonSerializable()
class TypeOfWork extends WithId {
  final String name;

  final double? rate;

  final bool archived;

  final bool billable;

  @JsonKey(name: "default")
  final bool isDefault;

  TypeOfWork(
      {required super.id,
      required this.name,
      required this.rate,
      required this.archived,
      required this.billable,
      required this.isDefault});

  factory TypeOfWork.fromJson(Map<String, dynamic> json) =>
      _$TypeOfWorkFromJson(json);

  Map<String, dynamic> toJson() => _$TypeOfWorkToJson(this);
}
