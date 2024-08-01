import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ActitimeApiException implements Exception {
  final String key;
  final String message;

  ActitimeApiException({required this.key, required this.message});

  factory ActitimeApiException.fromJson(Map<String, dynamic> json) =>
      _$ActitimeApiExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeApiExceptionToJson(this);
}
