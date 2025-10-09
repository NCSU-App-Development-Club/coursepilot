import 'package:dart_mappable/dart_mappable.dart';
part 'availability.mapper.dart';

@MappableClass()
class Availability with AvailabilityMappable {
  final String status;
  final int capacity;
  final int enrolled;
  final int waitlisted;

  Availability({
    required this.status,
    required this.capacity,
    required this.enrolled,
    required this.waitlisted,
  });
}
