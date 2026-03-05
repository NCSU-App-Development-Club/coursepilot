import 'package:dart_mappable/dart_mappable.dart';

part 'models.mapper.dart';

@MappableClass()
class CoursePrefixListing with CoursePrefixListingMappable {
  final String prefix;
  final String name;

  const CoursePrefixListing({required this.prefix, required this.name});
}

@MappableClass()
class CourseListing with CourseListingMappable {
  final String prefix;
  final String number;
  final String name;

  const CourseListing({
    required this.prefix,
    required this.number,
    required this.name,
  });
}

@MappableClass()
class CourseDetail with CourseDetailMappable {
  final String prefix;
  final String number;
  final String name;
  final String description;
  final int units;
  final List<String> semesters;

  const CourseDetail({
    required this.prefix,
    required this.number,
    required this.name,
    required this.description,
    required this.units,
    required this.semesters,
  });
}

@MappableClass()
class Availability with AvailabilityMappable {
  final String status;
  @MappableField(key: 'open_seats')
  final int openSeats;
  @MappableField(key: 'max_seats')
  final int maxSeats;
  final int waitlisted;

  const Availability({
    required this.status,
    required this.openSeats,
    required this.maxSeats,
    required this.waitlisted,
  });
}

@MappableClass()
class Schedule with ScheduleMappable {
  final List<String> days;
  @MappableField(key: 'begin_time')
  final String beginTime;
  @MappableField(key: 'end_time')
  final String endTime;

  const Schedule({
    required this.days,
    required this.beginTime,
    required this.endTime,
  });
}

@MappableClass()
class SectionDetail with SectionDetailMappable {
  @MappableField(key: 'course_prefix')
  final String coursePrefix;
  @MappableField(key: 'course_number')
  final String courseNumber;
  final String number;
  final String component;
  final Availability availability;
  final Schedule schedule;
  final String location;
  final List<String> instructors;
  final DateTime begin;
  final DateTime end;
  final List<String> restrictions;

  const SectionDetail({
    required this.coursePrefix,
    required this.courseNumber,
    required this.number,
    required this.component,
    required this.availability,
    required this.schedule,
    required this.location,
    required this.instructors,
    required this.begin,
    required this.end,
    required this.restrictions,
  });
}

@MappableClass()
class Semester with SemesterMappable {
  final String code;
  final String name;
  @MappableField(key: '_internal_code')
  final String internalCode;

  const Semester({
    required this.code,
    required this.name,
    required this.internalCode,
  });
}

@MappableClass()
class ProfessorDetail with ProfessorDetailMappable {
  final String name;
  final String department;
  final String school;
  @MappableField(key: 'num_ratings')
  final int numRatings;
  @MappableField(key: 'overall_quality')
  final double overallQuality;
  final double difficulty;
  @MappableField(key: 'would_take_again')
  final double wouldTakeAgain;
  final String link;

  const ProfessorDetail({
    required this.name,
    required this.department,
    required this.school,
    required this.numRatings,
    required this.overallQuality,
    required this.difficulty,
    required this.wouldTakeAgain,
    required this.link,
  });
}

@MappableClass()
class SavedSection with SavedSectionMappable {
  final String coursePrefix;
  final String courseNumber;
  final String sectionNumber;
  final String semester;

  const SavedSection({
    required this.coursePrefix,
    required this.courseNumber,
    required this.sectionNumber,
    required this.semester,
  });
}

@MappableClass()
class PlannedSchedule with PlannedScheduleMappable {
  final String id;
  final String name;
  final String semester;
  final List<SavedSection> sections;

  const PlannedSchedule({
    required this.id,
    required this.name,
    required this.semester,
    this.sections = const [],
  });
}
