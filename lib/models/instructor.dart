import 'package:dart_mappable/dart_mappable.dart';

part 'instructor.mapper.dart';

@MappableClass()
class Instructor with InstructorMappable {
  final String name;
  final String webpage;

  Instructor({required this.name, required this.webpage});
}
