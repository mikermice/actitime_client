import 'package:json_annotation/json_annotation.dart';
import './utils.dart';

part 'time_track.g.dart';

@JsonSerializable()
class ActitimeTimeTrackRecord {
  final int taskId;
  @JsonKey(fromJson: durationFromMinutes, toJson: durationToMinutes)
  final Duration time;
  final String? comment;

  ActitimeTimeTrackRecord(
      {required this.taskId, required this.time, this.comment});

  factory ActitimeTimeTrackRecord.fromJson(Map<String, dynamic> json) =>
      _$ActitimeTimeTrackRecordFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeTimeTrackRecordToJson(this);
}

@JsonSerializable()
class ActitimeTimeTrackData {
  final int userId;
  final List<ActitimeTimeTrackRecord> records;
  final bool? approved;
  final int dayOffset;
  final DateTime date;

  ActitimeTimeTrackData(
      {required this.userId,
      required this.records,
      this.approved,
      required this.dayOffset,
      required this.date});

  factory ActitimeTimeTrackData.fromJson(Map<String, dynamic> json) =>
      _$ActitimeTimeTrackDataFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeTimeTrackDataToJson(this);
}

@JsonSerializable()
class ActitimeTimeTrack {
  final DateTime dateFrom;
  final DateTime dateTo;
  final DateTime? nextDateFrom;
  final List<ActitimeTimeTrackData> data;

  ActitimeTimeTrack(
      {required this.dateFrom,
      required this.dateTo,
      this.nextDateFrom,
      required this.data});

  factory ActitimeTimeTrack.fromJson(Map<String, dynamic> json) =>
      _$ActitimeTimeTrackFromJson(json);

  Map<String, dynamic> toJson() => _$ActitimeTimeTrackToJson(this);
}
