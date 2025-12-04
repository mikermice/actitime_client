import 'package:json_annotation/json_annotation.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError implements Exception {
  /// Unique error key
  final String key;

  /// Human readable error message
  final String message;

  /// Stack-trace info for developers
  final String? stackTrace;

  /// Field (of fields) if any related to the error
  final String? fields;

  ApiError(
      {required this.key, required this.message, this.stackTrace, this.fields});

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ApiErrorToJson(this);
}
