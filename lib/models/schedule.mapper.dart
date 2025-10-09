// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'schedule.dart';

class ScheduleMapper extends ClassMapperBase<Schedule> {
  ScheduleMapper._();

  static ScheduleMapper? _instance;
  static ScheduleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScheduleMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Schedule';

  static List<String> _$days(Schedule v) => v.days;
  static const Field<Schedule, List<String>> _f$days = Field('days', _$days);
  static DateTime _$beginTime(Schedule v) => v.beginTime;
  static const Field<Schedule, DateTime> _f$beginTime =
      Field('beginTime', _$beginTime, key: r'begin_time');
  static DateTime _$endTime(Schedule v) => v.endTime;
  static const Field<Schedule, DateTime> _f$endTime =
      Field('endTime', _$endTime, key: r'end_time');

  @override
  final MappableFields<Schedule> fields = const {
    #days: _f$days,
    #beginTime: _f$beginTime,
    #endTime: _f$endTime,
  };

  static Schedule _instantiate(DecodingData data) {
    return Schedule(
        days: data.dec(_f$days),
        beginTime: data.dec(_f$beginTime),
        endTime: data.dec(_f$endTime));
  }

  @override
  final Function instantiate = _instantiate;

  static Schedule fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Schedule>(map);
  }

  static Schedule fromJson(String json) {
    return ensureInitialized().decodeJson<Schedule>(json);
  }
}

mixin ScheduleMappable {
  String toJson() {
    return ScheduleMapper.ensureInitialized()
        .encodeJson<Schedule>(this as Schedule);
  }

  Map<String, dynamic> toMap() {
    return ScheduleMapper.ensureInitialized()
        .encodeMap<Schedule>(this as Schedule);
  }

  ScheduleCopyWith<Schedule, Schedule, Schedule> get copyWith =>
      _ScheduleCopyWithImpl<Schedule, Schedule>(
          this as Schedule, $identity, $identity);
  @override
  String toString() {
    return ScheduleMapper.ensureInitialized().stringifyValue(this as Schedule);
  }

  @override
  bool operator ==(Object other) {
    return ScheduleMapper.ensureInitialized()
        .equalsValue(this as Schedule, other);
  }

  @override
  int get hashCode {
    return ScheduleMapper.ensureInitialized().hashValue(this as Schedule);
  }
}

extension ScheduleValueCopy<$R, $Out> on ObjectCopyWith<$R, Schedule, $Out> {
  ScheduleCopyWith<$R, Schedule, $Out> get $asSchedule =>
      $base.as((v, t, t2) => _ScheduleCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ScheduleCopyWith<$R, $In extends Schedule, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get days;
  $R call({List<String>? days, DateTime? beginTime, DateTime? endTime});
  ScheduleCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ScheduleCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Schedule, $Out>
    implements ScheduleCopyWith<$R, Schedule, $Out> {
  _ScheduleCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Schedule> $mapper =
      ScheduleMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get days =>
      ListCopyWith($value.days, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(days: v));
  @override
  $R call({List<String>? days, DateTime? beginTime, DateTime? endTime}) =>
      $apply(FieldCopyWithData({
        if (days != null) #days: days,
        if (beginTime != null) #beginTime: beginTime,
        if (endTime != null) #endTime: endTime
      }));
  @override
  Schedule $make(CopyWithData data) => Schedule(
      days: data.get(#days, or: $value.days),
      beginTime: data.get(#beginTime, or: $value.beginTime),
      endTime: data.get(#endTime, or: $value.endTime));

  @override
  ScheduleCopyWith<$R2, Schedule, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ScheduleCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
