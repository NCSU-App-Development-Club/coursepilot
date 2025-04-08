// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Section _$SectionFromJson(Map<String, dynamic> json) => Section(
  number: json['number'] as String,
  component: json['component'] as String,
  class_id: (json['class_id'] as num).toInt(),
  availability: Availability.fromJson(
    json['availability'] as Map<String, dynamic>,
  ),
  schedule:
      json['schedule'] == null
          ? null
          : Schedule.fromJson(json['schedule'] as Map<String, dynamic>),
  location: json['location'] as String,
  instructor:
      (json['instructor'] as List<dynamic>)
          .map((e) => Instructor.fromJson(e as Map<String, dynamic>))
          .toList(),
  begin_date: DateTime.parse(json['begin_date'] as String),
  end_date: DateTime.parse(json['end_date'] as String),
  notes: json['notes'] as String,
  requisites: json['requisites'] as String,
  restrictions: json['restrictions'] as String,
);

Map<String, dynamic> _$SectionToJson(Section instance) => <String, dynamic>{
  'number': instance.number,
  'component': instance.component,
  'class_id': instance.class_id,
  'availability': instance.availability,
  'schedule': instance.schedule,
  'location': instance.location,
  'instructor': instance.instructor,
  'begin_date': instance.begin_date.toIso8601String(),
  'end_date': instance.end_date.toIso8601String(),
  'notes': instance.notes,
  'requisites': instance.requisites,
  'restrictions': instance.restrictions,
};
