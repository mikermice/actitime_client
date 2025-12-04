import 'package:intl/intl.dart';

final apiDateFormat = DateFormat("yyyy-MM-dd");

int dateTimeToJson(DateTime dateTime) => dateTime.millisecondsSinceEpoch;

DateTime dateTimeFromJson(int millis) =>
    DateTime.fromMillisecondsSinceEpoch(millis);

int? nullableDateTimeToJson(DateTime? dateTime) =>
    dateTime?.millisecondsSinceEpoch;

DateTime? nullableDateTimeFromJson(int? millis) =>
    millis != null ? DateTime.fromMillisecondsSinceEpoch(millis) : null;

DateTime dateFromJson(String date) => apiDateFormat.parse(date);

String dateToJson(DateTime dt) => apiDateFormat.format(dt);

DateTime? nullableDateFromJson(String? date) =>
    date != null ? apiDateFormat.parse(date) : null;

String? nullableDateToJson(DateTime? dt) =>
    dt == null ? null : apiDateFormat.format(dt);

int durationToMinutes(Duration duration) => duration.inMinutes;

Duration durationFromMinutes(int minutes) => Duration(minutes: minutes);

int? nullableDurationToMinutes(Duration? duration) => duration?.inMinutes;

Duration? nullableDurationFromMinutes(int? minutes) =>
    minutes != null ? durationFromMinutes(minutes) : null;
