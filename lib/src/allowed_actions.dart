import 'package:json_annotation/json_annotation.dart';

part 'allowed_actions.g.dart';

@JsonSerializable()
class AllowedActions {
  final bool? canModify;
  final bool? canDelete;

  AllowedActions({this.canModify, this.canDelete});

  factory AllowedActions.fromJson(Map<String, dynamic> json) =>
      _$AllowedActionsFromJson(json);

  Map<String, dynamic> toJson() => _$AllowedActionsToJson(this);
}
