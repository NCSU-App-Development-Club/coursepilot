// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'schedule.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Schedule {

 List<String> get days; DateTime get begin_time; DateTime get end_time;
/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ScheduleCopyWith<Schedule> get copyWith => _$ScheduleCopyWithImpl<Schedule>(this as Schedule, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Schedule&&const DeepCollectionEquality().equals(other.days, days)&&(identical(other.begin_time, begin_time) || other.begin_time == begin_time)&&(identical(other.end_time, end_time) || other.end_time == end_time));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(days),begin_time,end_time);

@override
String toString() {
  return 'Schedule(days: $days, begin_time: $begin_time, end_time: $end_time)';
}


}

/// @nodoc
abstract mixin class $ScheduleCopyWith<$Res>  {
  factory $ScheduleCopyWith(Schedule value, $Res Function(Schedule) _then) = _$ScheduleCopyWithImpl;
@useResult
$Res call({
 List<String> days, DateTime begin_time, DateTime end_time
});




}
/// @nodoc
class _$ScheduleCopyWithImpl<$Res>
    implements $ScheduleCopyWith<$Res> {
  _$ScheduleCopyWithImpl(this._self, this._then);

  final Schedule _self;
  final $Res Function(Schedule) _then;

/// Create a copy of Schedule
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? days = null,Object? begin_time = null,Object? end_time = null,}) {
  return _then(Schedule(
days: null == days ? _self.days : days // ignore: cast_nullable_to_non_nullable
as List<String>,begin_time: null == begin_time ? _self.begin_time : begin_time // ignore: cast_nullable_to_non_nullable
as DateTime,end_time: null == end_time ? _self.end_time : end_time // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


// dart format on
