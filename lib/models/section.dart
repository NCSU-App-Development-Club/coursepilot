import 'package:dart_mappable/dart_mappable.dart';

import 'availability.dart';
import 'schedule.dart';
import 'instructor.dart';

part 'section.mapper.dart';

@MappableClass()
class Section with SectionMappable {
  final String number;
  final String component;
  final int classId;
  final Availability availability;
  final Schedule? schedule;
  final String location;
  final List<Instructor> instructor;
  final DateTime beginDate;
  final DateTime endDate;
  final String notes;
  final String requisites;
  final String restrictions;

  Section({
    required this.number,
    required this.component,
    required this.classId,
    required this.availability,
    this.schedule,
    required this.location,
    required this.instructor,
    required this.beginDate,
    required this.endDate,
    required this.notes,
    required this.requisites,
    required this.restrictions,
  });
}
