// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'allowed_actions.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AllowedActions _$AllowedActionsFromJson(Map<String, dynamic> json) =>
    AllowedActions(
      canModify: json['canModify'] as bool?,
      canDelete: json['canDelete'] as bool?,
    );

Map<String, dynamic> _$AllowedActionsToJson(AllowedActions instance) =>
    <String, dynamic>{
      'canModify': instance.canModify,
      'canDelete': instance.canDelete,
    };
