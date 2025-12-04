import './base.dart';
import './item_list.dart';
import './user.dart';
import './utils.dart';
import 'package:json_annotation/json_annotation.dart';
part 'comment.g.dart';

@JsonSerializable()
class Comment extends WithId {
  /// Unique user identifier
  final int userId;

  /// Creation date and time
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime created;

  /// Date and time of last editing
  @JsonKey(fromJson: dateTimeFromJson, toJson: dateTimeToJson)
  final DateTime updated;

  /// Unique identifier of the user who made the last editing
  final int updatingUserId;

  /// Text of the comment
  final String text;

  const Comment(
      {required super.id,
      required this.userId,
      required this.created,
      required this.updated,
      required this.updatingUserId,
      required this.text});

  factory Comment.fromJson(Map<String, dynamic> json) =>
      _$CommentFromJson(json);

  Map<String, dynamic> toJson() => _$CommentToJson(this);
}

@JsonSerializable()
class CommentList extends ItemList {
  final List<Comment> items;

  final Map<int, User>? users;

  CommentList(
      {required super.offset,
      required super.limit,
      required this.items,
      this.users});

  factory CommentList.fromJson(Map<String, dynamic> json) =>
      _$CommentListFromJson(json);

  Map<String, dynamic> toJson() => _$CommentListToJson(this);
}
