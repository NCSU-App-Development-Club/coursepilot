// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'section.dart';

class SectionMapper extends ClassMapperBase<Section> {
  SectionMapper._();

  static SectionMapper? _instance;
  static SectionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SectionMapper._());
      AvailabilityMapper.ensureInitialized();
      ScheduleMapper.ensureInitialized();
      InstructorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Section';

  static String _$number(Section v) => v.number;
  static const Field<Section, String> _f$number = Field('number', _$number);
  static String _$component(Section v) => v.component;
  static const Field<Section, String> _f$component =
      Field('component', _$component);
  static int _$classId(Section v) => v.classId;
  static const Field<Section, int> _f$classId = Field('classId', _$classId);
  static Availability _$availability(Section v) => v.availability;
  static const Field<Section, Availability> _f$availability =
      Field('availability', _$availability);
  static Schedule? _$schedule(Section v) => v.schedule;
  static const Field<Section, Schedule> _f$schedule =
      Field('schedule', _$schedule, opt: true);
  static String _$location(Section v) => v.location;
  static const Field<Section, String> _f$location =
      Field('location', _$location);
  static List<Instructor> _$instructor(Section v) => v.instructor;
  static const Field<Section, List<Instructor>> _f$instructor =
      Field('instructor', _$instructor);
  static DateTime _$beginDate(Section v) => v.beginDate;
  static const Field<Section, DateTime> _f$beginDate =
      Field('beginDate', _$beginDate);
  static DateTime _$endDate(Section v) => v.endDate;
  static const Field<Section, DateTime> _f$endDate =
      Field('endDate', _$endDate);
  static String _$notes(Section v) => v.notes;
  static const Field<Section, String> _f$notes = Field('notes', _$notes);
  static String _$requisites(Section v) => v.requisites;
  static const Field<Section, String> _f$requisites =
      Field('requisites', _$requisites);
  static String _$restrictions(Section v) => v.restrictions;
  static const Field<Section, String> _f$restrictions =
      Field('restrictions', _$restrictions);

  @override
  final MappableFields<Section> fields = const {
    #number: _f$number,
    #component: _f$component,
    #classId: _f$classId,
    #availability: _f$availability,
    #schedule: _f$schedule,
    #location: _f$location,
    #instructor: _f$instructor,
    #beginDate: _f$beginDate,
    #endDate: _f$endDate,
    #notes: _f$notes,
    #requisites: _f$requisites,
    #restrictions: _f$restrictions,
  };

  static Section _instantiate(DecodingData data) {
    return Section(
        number: data.dec(_f$number),
        component: data.dec(_f$component),
        classId: data.dec(_f$classId),
        availability: data.dec(_f$availability),
        schedule: data.dec(_f$schedule),
        location: data.dec(_f$location),
        instructor: data.dec(_f$instructor),
        beginDate: data.dec(_f$beginDate),
        endDate: data.dec(_f$endDate),
        notes: data.dec(_f$notes),
        requisites: data.dec(_f$requisites),
        restrictions: data.dec(_f$restrictions));
  }

  @override
  final Function instantiate = _instantiate;

  static Section fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Section>(map);
  }

  static Section fromJson(String json) {
    return ensureInitialized().decodeJson<Section>(json);
  }
}

mixin SectionMappable {
  String toJson() {
    return SectionMapper.ensureInitialized()
        .encodeJson<Section>(this as Section);
  }

  Map<String, dynamic> toMap() {
    return SectionMapper.ensureInitialized()
        .encodeMap<Section>(this as Section);
  }

  SectionCopyWith<Section, Section, Section> get copyWith =>
      _SectionCopyWithImpl<Section, Section>(
          this as Section, $identity, $identity);
  @override
  String toString() {
    return SectionMapper.ensureInitialized().stringifyValue(this as Section);
  }

  @override
  bool operator ==(Object other) {
    return SectionMapper.ensureInitialized()
        .equalsValue(this as Section, other);
  }

  @override
  int get hashCode {
    return SectionMapper.ensureInitialized().hashValue(this as Section);
  }
}

extension SectionValueCopy<$R, $Out> on ObjectCopyWith<$R, Section, $Out> {
  SectionCopyWith<$R, Section, $Out> get $asSection =>
      $base.as((v, t, t2) => _SectionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SectionCopyWith<$R, $In extends Section, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  AvailabilityCopyWith<$R, Availability, Availability> get availability;
  ScheduleCopyWith<$R, Schedule, Schedule>? get schedule;
  ListCopyWith<$R, Instructor, InstructorCopyWith<$R, Instructor, Instructor>>
      get instructor;
  $R call(
      {String? number,
      String? component,
      int? classId,
      Availability? availability,
      Schedule? schedule,
      String? location,
      List<Instructor>? instructor,
      DateTime? beginDate,
      DateTime? endDate,
      String? notes,
      String? requisites,
      String? restrictions});
  SectionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SectionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Section, $Out>
    implements SectionCopyWith<$R, Section, $Out> {
  _SectionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Section> $mapper =
      SectionMapper.ensureInitialized();
  @override
  AvailabilityCopyWith<$R, Availability, Availability> get availability =>
      $value.availability.copyWith.$chain((v) => call(availability: v));
  @override
  ScheduleCopyWith<$R, Schedule, Schedule>? get schedule =>
      $value.schedule?.copyWith.$chain((v) => call(schedule: v));
  @override
  ListCopyWith<$R, Instructor, InstructorCopyWith<$R, Instructor, Instructor>>
      get instructor => ListCopyWith($value.instructor,
          (v, t) => v.copyWith.$chain(t), (v) => call(instructor: v));
  @override
  $R call(
          {String? number,
          String? component,
          int? classId,
          Availability? availability,
          Object? schedule = $none,
          String? location,
          List<Instructor>? instructor,
          DateTime? beginDate,
          DateTime? endDate,
          String? notes,
          String? requisites,
          String? restrictions}) =>
      $apply(FieldCopyWithData({
        if (number != null) #number: number,
        if (component != null) #component: component,
        if (classId != null) #classId: classId,
        if (availability != null) #availability: availability,
        if (schedule != $none) #schedule: schedule,
        if (location != null) #location: location,
        if (instructor != null) #instructor: instructor,
        if (beginDate != null) #beginDate: beginDate,
        if (endDate != null) #endDate: endDate,
        if (notes != null) #notes: notes,
        if (requisites != null) #requisites: requisites,
        if (restrictions != null) #restrictions: restrictions
      }));
  @override
  Section $make(CopyWithData data) => Section(
      number: data.get(#number, or: $value.number),
      component: data.get(#component, or: $value.component),
      classId: data.get(#classId, or: $value.classId),
      availability: data.get(#availability, or: $value.availability),
      schedule: data.get(#schedule, or: $value.schedule),
      location: data.get(#location, or: $value.location),
      instructor: data.get(#instructor, or: $value.instructor),
      beginDate: data.get(#beginDate, or: $value.beginDate),
      endDate: data.get(#endDate, or: $value.endDate),
      notes: data.get(#notes, or: $value.notes),
      requisites: data.get(#requisites, or: $value.requisites),
      restrictions: data.get(#restrictions, or: $value.restrictions));

  @override
  SectionCopyWith<$R2, Section, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SectionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
