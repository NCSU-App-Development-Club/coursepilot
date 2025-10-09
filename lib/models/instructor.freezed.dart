// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'instructor.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Instructor {

 String get name; String get webpage;
/// Create a copy of Instructor
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$InstructorCopyWith<Instructor> get copyWith => _$InstructorCopyWithImpl<Instructor>(this as Instructor, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Instructor&&(identical(other.name, name) || other.name == name)&&(identical(other.webpage, webpage) || other.webpage == webpage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,webpage);

@override
String toString() {
  return 'Instructor(name: $name, webpage: $webpage)';
}


}

/// @nodoc
abstract mixin class $InstructorCopyWith<$Res>  {
  factory $InstructorCopyWith(Instructor value, $Res Function(Instructor) _then) = _$InstructorCopyWithImpl;
@useResult
$Res call({
 String name, String webpage
});




}
/// @nodoc
class _$InstructorCopyWithImpl<$Res>
    implements $InstructorCopyWith<$Res> {
  _$InstructorCopyWithImpl(this._self, this._then);

  final Instructor _self;
  final $Res Function(Instructor) _then;

/// Create a copy of Instructor
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? webpage = null,}) {
  return _then(Instructor(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,webpage: null == webpage ? _self.webpage : webpage // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
