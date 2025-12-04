// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'type_of_work.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TypeOfWork _$TypeOfWorkFromJson(Map<String, dynamic> json) => TypeOfWork(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      rate: (json['rate'] as num?)?.toDouble(),
      archived: json['archived'] as bool,
      billable: json['billable'] as bool,
      isDefault: json['default'] as bool,
    );

Map<String, dynamic> _$TypeOfWorkToJson(TypeOfWork instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'rate': instance.rate,
      'archived': instance.archived,
      'billable': instance.billable,
      'default': instance.isDefault,
    };
