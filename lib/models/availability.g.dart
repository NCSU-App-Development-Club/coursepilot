// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'availability.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Availability _$AvailabilityFromJson(Map<String, dynamic> json) => Availability(
  status: json['status'] as String,
  capacity: (json['capacity'] as num).toInt(),
  enrolled: (json['enrolled'] as num).toInt(),
  waitlisted: (json['waitlisted'] as num).toInt(),
);

Map<String, dynamic> _$AvailabilityToJson(Availability instance) =>
    <String, dynamic>{
      'status': instance.status,
      'capacity': instance.capacity,
      'enrolled': instance.enrolled,
      'waitlisted': instance.waitlisted,
    };
