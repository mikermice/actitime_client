// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      key: json['key'] as String,
      message: json['message'] as String,
      stackTrace: json['stackTrace'] as String?,
      fields: json['fields'] as String?,
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'key': instance.key,
      'message': instance.message,
      'stackTrace': instance.stackTrace,
      'fields': instance.fields,
    };
