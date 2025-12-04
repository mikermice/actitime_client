import 'package:json_annotation/json_annotation.dart';
import './allowed_actions.dart';
import './base.dart';
import './item_list.dart';
import './utils.dart';

part 'customer.g.dart';

@JsonSerializable()
class Customer extends WithId {
  /// Customer name
  final String name;

  /// Whether this customer has been archived
  final bool archived;

  /// Creation date and time
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime created;

  /// Customer description
  final String? description;

  /// URL of the customer
  final String url;

  Customer(
      {required super.id,
      required this.name,
      required this.archived,
      required this.created,
      this.description,
      required this.url});

  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerToJson(this);
}

@JsonSerializable()
class CustomerWithAllowedActions extends Customer {
  final AllowedActions allowedActions;

  CustomerWithAllowedActions(
      {required super.id,
      required super.name,
      required super.archived,
      required super.created,
      required super.url,
      required this.allowedActions});

  factory CustomerWithAllowedActions.fromJson(Map<String, dynamic> json) =>
      _$CustomerWithAllowedActionsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$CustomerWithAllowedActionsToJson(this);
}

@JsonSerializable()
class CustomerList extends ItemList {
  /// List of customers
  final List<CustomerWithAllowedActions> items;

  CustomerList(
      {required super.offset, required super.limit, required this.items});

  factory CustomerList.fromJson(Map<String, dynamic> json) =>
      _$CustomerListFromJson(json);

  Map<String, dynamic> toJson() => _$CustomerListToJson(this);
}
