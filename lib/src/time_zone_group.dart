import 'package:json_annotation/json_annotation.dart';
import './base.dart';

part 'time_zone_group.g.dart';

/// Represents single location with associated time zone where users could be
/// assigned
@JsonSerializable()
class TimeZoneGroup extends WithId {
  /// Human-readable name of associated location
  final String name;

  /// Time Zone Id in format of IANA Time Zone Database
  final int timeZoneId;

  /// Wheather this is the default time zone group
  @JsonKey(name: "default")
  final bool isDefault;

  TimeZoneGroup(
      {required super.id,
      required this.name,
      required this.timeZoneId,
      required this.isDefault});

  factory TimeZoneGroup.fromJson(Map<String, dynamic> json) =>
      _$TimeZoneGroupFromJson(json);

  Map<String, dynamic> toJson() => _$TimeZoneGroupToJson(this);
}
