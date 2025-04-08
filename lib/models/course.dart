import 'section.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course.freezed.dart';
part 'course.g.dart';

@freezed
@JsonSerializable()
class Course with _$Course {
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
  
  factory Course.fromJson(Map<String, Object?> json) => _$CourseFromJson(json);

  Map<String, Object?> toJson() => _$CourseToJson(this);
}