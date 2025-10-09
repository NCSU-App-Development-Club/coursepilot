import 'package:coursepilot/models/course.dart';
import 'package:coursepilot/features/http/network/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'courses.g.dart';

// you can then get the courses via
// final coursesAsync = ref.watch(coursesProvider)
// then you can do `final courses = coursesAsync.valueOrNull`
// there are other ways of doing this
// check out https://riverpod.dev/ (you'll definitely need this)
//
// At the start, before the backend is done, you may want to make
// fake courses, returning them either here or the ApiService.
@riverpod
Future<List<Course>> courses(Ref ref) async {
  return await ApiService.fetchCourses();
}
