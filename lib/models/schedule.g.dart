// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Schedule _$ScheduleFromJson(Map<String, dynamic> json) => Schedule(
  days: (json['days'] as List<dynamic>).map((e) => e as String).toList(),
  begin_time: DateTime.parse(json['begin_time'] as String),
  end_time: DateTime.parse(json['end_time'] as String),
);

Map<String, dynamic> _$ScheduleToJson(Schedule instance) => <String, dynamic>{
  'days': instance.days,
  'begin_time': instance.begin_time.toIso8601String(),
  'end_time': instance.end_time.toIso8601String(),
};
