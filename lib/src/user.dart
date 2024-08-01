import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class ActitimeUser {
  final int id;
  final int departmentId;
  final int timeZoneGroupId;
  final bool active;
  final String fullName;
  final String firstName;
  final String middleName;
  final String lastName;

  ActitimeUser(
      {required this.id,
      required this.departmentId,
      required this.timeZoneGroupId,
      required this.active,
      required this.fullName,
      required this.firstName,
      required this.middleName,
      required this.lastName});

  factory ActitimeUser.fromJson(Map<String, dynamic> json) =>
      _$ActitimeUserFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeUserToJson(this);
}
