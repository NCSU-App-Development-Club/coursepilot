// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Course _$CourseFromJson(Map<String, dynamic> json) => Course(
  subject: json['subject'] as String,
  code: (json['code'] as num).toInt(),
  name: json['name'] as String,
  description: json['description'] as String,
  credits: (json['credits'] as num).toInt(),
  sections:
      (json['sections'] as List<dynamic>)
          .map((e) => Section.fromJson(e as Map<String, dynamic>))
          .toList(),
);

Map<String, dynamic> _$CourseToJson(Course instance) => <String, dynamic>{
  'subject': instance.subject,
  'code': instance.code,
  'name': instance.name,
  'description': instance.description,
  'credits': instance.credits,
  'sections': instance.sections,
};
