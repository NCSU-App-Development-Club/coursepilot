import 'package:dart_mappable/dart_mappable.dart';

part 'schedule.mapper.dart';

@MappableClass()
class Schedule with ScheduleMappable {
  final List<String> days;
  final DateTime beginTime;
  final DateTime endTime;

  Schedule({
    required this.days,
    required this.beginTime,
    required this.endTime,
  });
}
