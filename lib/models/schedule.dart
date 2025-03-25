import 'package:flutter/material.dart';

class Schedule {
    final List<String> days;
    final TimeOfDay begin_time;
    final TimeOfDay end_time;

    Schedule({
      required this.days,
      required this.begin_time,
      required this.end_time,
    });
}