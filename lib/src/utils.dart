int dateTimeToJson(DateTime dateTime) => dateTime.millisecondsSinceEpoch;

DateTime dateTimeFromJson(int millis) =>
    DateTime.fromMillisecondsSinceEpoch(millis);

int? nullableDateTimeToJson(DateTime? dateTime) =>
    dateTime?.millisecondsSinceEpoch;

DateTime? nullableDateTimeFromJson(int? millis) =>
    millis != null ? DateTime.fromMillisecondsSinceEpoch(millis) : null;

int durationToMinutes(Duration duration) => duration.inMinutes;

Duration durationFromMinutes(int minutes) => Duration(minutes: minutes);

int? nullableDurationToMinutes(Duration? duration) => duration?.inMinutes;

Duration? nullableDurationFromMinutes(int? minutes) =>
    minutes != null ? durationFromMinutes(minutes) : null;
