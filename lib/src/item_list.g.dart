// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ItemList _$ItemListFromJson(Map<String, dynamic> json) => ItemList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$ItemListToJson(ItemList instance) => <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
    };
