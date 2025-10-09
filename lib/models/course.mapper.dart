// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'course.dart';

class CourseMapper extends ClassMapperBase<Course> {
  CourseMapper._();

  static CourseMapper? _instance;
  static CourseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CourseMapper._());
      SectionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Course';

  static String _$subject(Course v) => v.subject;
  static const Field<Course, String> _f$subject = Field('subject', _$subject);
  static int _$code(Course v) => v.code;
  static const Field<Course, int> _f$code = Field('code', _$code);
  static String _$name(Course v) => v.name;
  static const Field<Course, String> _f$name = Field('name', _$name);
  static String _$description(Course v) => v.description;
  static const Field<Course, String> _f$description =
      Field('description', _$description);
  static int _$credits(Course v) => v.credits;
  static const Field<Course, int> _f$credits = Field('credits', _$credits);
  static List<Section> _$sections(Course v) => v.sections;
  static const Field<Course, List<Section>> _f$sections =
      Field('sections', _$sections);

  @override
  final MappableFields<Course> fields = const {
    #subject: _f$subject,
    #code: _f$code,
    #name: _f$name,
    #description: _f$description,
    #credits: _f$credits,
    #sections: _f$sections,
  };

  static Course _instantiate(DecodingData data) {
    return Course(
        subject: data.dec(_f$subject),
        code: data.dec(_f$code),
        name: data.dec(_f$name),
        description: data.dec(_f$description),
        credits: data.dec(_f$credits),
        sections: data.dec(_f$sections));
  }

  @override
  final Function instantiate = _instantiate;

  static Course fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Course>(map);
  }

  static Course fromJson(String json) {
    return ensureInitialized().decodeJson<Course>(json);
  }
}

mixin CourseMappable {
  String toJson() {
    return CourseMapper.ensureInitialized().encodeJson<Course>(this as Course);
  }

  Map<String, dynamic> toMap() {
    return CourseMapper.ensureInitialized().encodeMap<Course>(this as Course);
  }

  CourseCopyWith<Course, Course, Course> get copyWith =>
      _CourseCopyWithImpl<Course, Course>(this as Course, $identity, $identity);
  @override
  String toString() {
    return CourseMapper.ensureInitialized().stringifyValue(this as Course);
  }

  @override
  bool operator ==(Object other) {
    return CourseMapper.ensureInitialized().equalsValue(this as Course, other);
  }

  @override
  int get hashCode {
    return CourseMapper.ensureInitialized().hashValue(this as Course);
  }
}

extension CourseValueCopy<$R, $Out> on ObjectCopyWith<$R, Course, $Out> {
  CourseCopyWith<$R, Course, $Out> get $asCourse =>
      $base.as((v, t, t2) => _CourseCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CourseCopyWith<$R, $In extends Course, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Section, SectionCopyWith<$R, Section, Section>> get sections;
  $R call(
      {String? subject,
      int? code,
      String? name,
      String? description,
      int? credits,
      List<Section>? sections});
  CourseCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CourseCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Course, $Out>
    implements CourseCopyWith<$R, Course, $Out> {
  _CourseCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Course> $mapper = CourseMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Section, SectionCopyWith<$R, Section, Section>>
      get sections => ListCopyWith($value.sections,
          (v, t) => v.copyWith.$chain(t), (v) => call(sections: v));
  @override
  $R call(
          {String? subject,
          int? code,
          String? name,
          String? description,
          int? credits,
          List<Section>? sections}) =>
      $apply(FieldCopyWithData({
        if (subject != null) #subject: subject,
        if (code != null) #code: code,
        if (name != null) #name: name,
        if (description != null) #description: description,
        if (credits != null) #credits: credits,
        if (sections != null) #sections: sections
      }));
  @override
  Course $make(CopyWithData data) => Course(
      subject: data.get(#subject, or: $value.subject),
      code: data.get(#code, or: $value.code),
      name: data.get(#name, or: $value.name),
      description: data.get(#description, or: $value.description),
      credits: data.get(#credits, or: $value.credits),
      sections: data.get(#sections, or: $value.sections));

  @override
  CourseCopyWith<$R2, Course, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CourseCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
