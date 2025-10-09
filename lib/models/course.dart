import 'package:dart_mappable/dart_mappable.dart';

import 'section.dart';
part 'course.mapper.dart';

@MappableClass()
class Course with CourseMappable {
  final String subject;
  final int code;
  final String name;
  final String description;
  final int credits;
  final List<Section> sections;

  Course({
    required this.subject,
    required this.code,
    required this.name,
    required this.description,
    required this.credits,
    required this.sections,
  });
}
