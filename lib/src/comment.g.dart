// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Comment _$CommentFromJson(Map<String, dynamic> json) => Comment(
      id: (json['id'] as num).toInt(),
      userId: (json['userId'] as num).toInt(),
      created: dateTimeFromJson((json['created'] as num).toInt()),
      updated: dateTimeFromJson((json['updated'] as num).toInt()),
      updatingUserId: (json['updatingUserId'] as num).toInt(),
      text: json['text'] as String,
    );

Map<String, dynamic> _$CommentToJson(Comment instance) => <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'created': dateTimeToJson(instance.created),
      'updated': dateTimeToJson(instance.updated),
      'updatingUserId': instance.updatingUserId,
      'text': instance.text,
    };

CommentList _$CommentListFromJson(Map<String, dynamic> json) => CommentList(
      offset: (json['offset'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
      items: (json['items'] as List<dynamic>)
          .map((e) => Comment.fromJson(e as Map<String, dynamic>))
          .toList(),
      users: (json['users'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(int.parse(k), User.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$CommentListToJson(CommentList instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'limit': instance.limit,
      'items': instance.items,
      'users': instance.users?.map((k, e) => MapEntry(k.toString(), e)),
    };
