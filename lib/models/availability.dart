import 'package:freezed_annotation/freezed_annotation.dart';

part 'availability.freezed.dart';
part 'availability.g.dart';

@freezed
@JsonSerializable()
class Availability with _$Availability {
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

    factory Availability.fromJson(Map<String, Object?> json) => _$AvailabilityFromJson(json);

    Map<String, Object?> toJson() => _$AvailabilityToJson(this);
}