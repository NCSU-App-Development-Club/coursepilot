// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'availability.dart';

class AvailabilityMapper extends ClassMapperBase<Availability> {
  AvailabilityMapper._();

  static AvailabilityMapper? _instance;
  static AvailabilityMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AvailabilityMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Availability';

  static String _$status(Availability v) => v.status;
  static const Field<Availability, String> _f$status =
      Field('status', _$status);
  static int _$capacity(Availability v) => v.capacity;
  static const Field<Availability, int> _f$capacity =
      Field('capacity', _$capacity);
  static int _$enrolled(Availability v) => v.enrolled;
  static const Field<Availability, int> _f$enrolled =
      Field('enrolled', _$enrolled);
  static int _$waitlisted(Availability v) => v.waitlisted;
  static const Field<Availability, int> _f$waitlisted =
      Field('waitlisted', _$waitlisted);

  @override
  final MappableFields<Availability> fields = const {
    #status: _f$status,
    #capacity: _f$capacity,
    #enrolled: _f$enrolled,
    #waitlisted: _f$waitlisted,
  };

  static Availability _instantiate(DecodingData data) {
    return Availability(
        status: data.dec(_f$status),
        capacity: data.dec(_f$capacity),
        enrolled: data.dec(_f$enrolled),
        waitlisted: data.dec(_f$waitlisted));
  }

  @override
  final Function instantiate = _instantiate;

  static Availability fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Availability>(map);
  }

  static Availability fromJson(String json) {
    return ensureInitialized().decodeJson<Availability>(json);
  }
}

mixin AvailabilityMappable {
  String toJson() {
    return AvailabilityMapper.ensureInitialized()
        .encodeJson<Availability>(this as Availability);
  }

  Map<String, dynamic> toMap() {
    return AvailabilityMapper.ensureInitialized()
        .encodeMap<Availability>(this as Availability);
  }

  AvailabilityCopyWith<Availability, Availability, Availability> get copyWith =>
      _AvailabilityCopyWithImpl<Availability, Availability>(
          this as Availability, $identity, $identity);
  @override
  String toString() {
    return AvailabilityMapper.ensureInitialized()
        .stringifyValue(this as Availability);
  }

  @override
  bool operator ==(Object other) {
    return AvailabilityMapper.ensureInitialized()
        .equalsValue(this as Availability, other);
  }

  @override
  int get hashCode {
    return AvailabilityMapper.ensureInitialized()
        .hashValue(this as Availability);
  }
}

extension AvailabilityValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Availability, $Out> {
  AvailabilityCopyWith<$R, Availability, $Out> get $asAvailability =>
      $base.as((v, t, t2) => _AvailabilityCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AvailabilityCopyWith<$R, $In extends Availability, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? status, int? capacity, int? enrolled, int? waitlisted});
  AvailabilityCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AvailabilityCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Availability, $Out>
    implements AvailabilityCopyWith<$R, Availability, $Out> {
  _AvailabilityCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Availability> $mapper =
      AvailabilityMapper.ensureInitialized();
  @override
  $R call({String? status, int? capacity, int? enrolled, int? waitlisted}) =>
      $apply(FieldCopyWithData({
        if (status != null) #status: status,
        if (capacity != null) #capacity: capacity,
        if (enrolled != null) #enrolled: enrolled,
        if (waitlisted != null) #waitlisted: waitlisted
      }));
  @override
  Availability $make(CopyWithData data) => Availability(
      status: data.get(#status, or: $value.status),
      capacity: data.get(#capacity, or: $value.capacity),
      enrolled: data.get(#enrolled, or: $value.enrolled),
      waitlisted: data.get(#waitlisted, or: $value.waitlisted));

  @override
  AvailabilityCopyWith<$R2, Availability, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _AvailabilityCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
