// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'section.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Section {

 String get number; String get component; int get class_id; Availability get availability; Schedule? get schedule; String get location; List<Instructor> get instructor; DateTime get begin_date; DateTime get end_date; String get notes; String get requisites; String get restrictions;
/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SectionCopyWith<Section> get copyWith => _$SectionCopyWithImpl<Section>(this as Section, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Section&&(identical(other.number, number) || other.number == number)&&(identical(other.component, component) || other.component == component)&&(identical(other.class_id, class_id) || other.class_id == class_id)&&(identical(other.availability, availability) || other.availability == availability)&&(identical(other.schedule, schedule) || other.schedule == schedule)&&(identical(other.location, location) || other.location == location)&&const DeepCollectionEquality().equals(other.instructor, instructor)&&(identical(other.begin_date, begin_date) || other.begin_date == begin_date)&&(identical(other.end_date, end_date) || other.end_date == end_date)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.requisites, requisites) || other.requisites == requisites)&&(identical(other.restrictions, restrictions) || other.restrictions == restrictions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,number,component,class_id,availability,schedule,location,const DeepCollectionEquality().hash(instructor),begin_date,end_date,notes,requisites,restrictions);

@override
String toString() {
  return 'Section(number: $number, component: $component, class_id: $class_id, availability: $availability, schedule: $schedule, location: $location, instructor: $instructor, begin_date: $begin_date, end_date: $end_date, notes: $notes, requisites: $requisites, restrictions: $restrictions)';
}


}

/// @nodoc
abstract mixin class $SectionCopyWith<$Res>  {
  factory $SectionCopyWith(Section value, $Res Function(Section) _then) = _$SectionCopyWithImpl;
@useResult
$Res call({
 String number, String component, int class_id, Availability availability, Schedule? schedule, String location, List<Instructor> instructor, DateTime begin_date, DateTime end_date, String notes, String requisites, String restrictions
});




}
/// @nodoc
class _$SectionCopyWithImpl<$Res>
    implements $SectionCopyWith<$Res> {
  _$SectionCopyWithImpl(this._self, this._then);

  final Section _self;
  final $Res Function(Section) _then;

/// Create a copy of Section
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? number = null,Object? component = null,Object? class_id = null,Object? availability = null,Object? schedule = freezed,Object? location = null,Object? instructor = null,Object? begin_date = null,Object? end_date = null,Object? notes = null,Object? requisites = null,Object? restrictions = null,}) {
  return _then(Section(
number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as String,component: null == component ? _self.component : component // ignore: cast_nullable_to_non_nullable
as String,class_id: null == class_id ? _self.class_id : class_id // ignore: cast_nullable_to_non_nullable
as int,availability: null == availability ? _self.availability : availability // ignore: cast_nullable_to_non_nullable
as Availability,schedule: freezed == schedule ? _self.schedule : schedule // ignore: cast_nullable_to_non_nullable
as Schedule?,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String,instructor: null == instructor ? _self.instructor : instructor // ignore: cast_nullable_to_non_nullable
as List<Instructor>,begin_date: null == begin_date ? _self.begin_date : begin_date // ignore: cast_nullable_to_non_nullable
as DateTime,end_date: null == end_date ? _self.end_date : end_date // ignore: cast_nullable_to_non_nullable
as DateTime,notes: null == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String,requisites: null == requisites ? _self.requisites : requisites // ignore: cast_nullable_to_non_nullable
as String,restrictions: null == restrictions ? _self.restrictions : restrictions // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


// dart format on
