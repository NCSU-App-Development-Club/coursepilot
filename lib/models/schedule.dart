import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedule.freezed.dart';
part 'schedule.g.dart';

@freezed
@JsonSerializable()
class Schedule with _$Schedule {
    final List<String> days;
    final DateTime begin_time;
    final DateTime end_time;

    Schedule({
      required this.days,
      required this.begin_time,
      required this.end_time,
    });

    factory Schedule.fromJson(Map<String, Object?> json) => _$ScheduleFromJson(json);

    Map<String, Object?> toJson() => _$ScheduleToJson(this);
}