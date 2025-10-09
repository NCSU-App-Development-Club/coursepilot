// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'instructor.dart';

class InstructorMapper extends ClassMapperBase<Instructor> {
  InstructorMapper._();

  static InstructorMapper? _instance;
  static InstructorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = InstructorMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Instructor';

  static String _$name(Instructor v) => v.name;
  static const Field<Instructor, String> _f$name = Field('name', _$name);
  static String _$webpage(Instructor v) => v.webpage;
  static const Field<Instructor, String> _f$webpage =
      Field('webpage', _$webpage);

  @override
  final MappableFields<Instructor> fields = const {
    #name: _f$name,
    #webpage: _f$webpage,
  };

  static Instructor _instantiate(DecodingData data) {
    return Instructor(name: data.dec(_f$name), webpage: data.dec(_f$webpage));
  }

  @override
  final Function instantiate = _instantiate;

  static Instructor fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Instructor>(map);
  }

  static Instructor fromJson(String json) {
    return ensureInitialized().decodeJson<Instructor>(json);
  }
}

mixin InstructorMappable {
  String toJson() {
    return InstructorMapper.ensureInitialized()
        .encodeJson<Instructor>(this as Instructor);
  }

  Map<String, dynamic> toMap() {
    return InstructorMapper.ensureInitialized()
        .encodeMap<Instructor>(this as Instructor);
  }

  InstructorCopyWith<Instructor, Instructor, Instructor> get copyWith =>
      _InstructorCopyWithImpl<Instructor, Instructor>(
          this as Instructor, $identity, $identity);
  @override
  String toString() {
    return InstructorMapper.ensureInitialized()
        .stringifyValue(this as Instructor);
  }

  @override
  bool operator ==(Object other) {
    return InstructorMapper.ensureInitialized()
        .equalsValue(this as Instructor, other);
  }

  @override
  int get hashCode {
    return InstructorMapper.ensureInitialized().hashValue(this as Instructor);
  }
}

extension InstructorValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Instructor, $Out> {
  InstructorCopyWith<$R, Instructor, $Out> get $asInstructor =>
      $base.as((v, t, t2) => _InstructorCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class InstructorCopyWith<$R, $In extends Instructor, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? webpage});
  InstructorCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _InstructorCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Instructor, $Out>
    implements InstructorCopyWith<$R, Instructor, $Out> {
  _InstructorCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Instructor> $mapper =
      InstructorMapper.ensureInitialized();
  @override
  $R call({String? name, String? webpage}) => $apply(FieldCopyWithData(
      {if (name != null) #name: name, if (webpage != null) #webpage: webpage}));
  @override
  Instructor $make(CopyWithData data) => Instructor(
      name: data.get(#name, or: $value.name),
      webpage: data.get(#webpage, or: $value.webpage));

  @override
  InstructorCopyWith<$R2, Instructor, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _InstructorCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
