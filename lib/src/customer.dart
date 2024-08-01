import 'package:json_annotation/json_annotation.dart';
import './utils.dart';
part 'customer.g.dart';

@JsonSerializable()
class ActitimeCustomer {
  final int id;
  final String name;
  final bool archived;
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime created;
  final String description;
  final String url;

  ActitimeCustomer(
      {required this.id,
      required this.name,
      required this.archived,
      required this.created,
      required this.description,
      required this.url});

  factory ActitimeCustomer.fromJson(Map<String, dynamic> json) =>
      _$ActitimeCustomerFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeCustomerToJson(this);
}
