import 'package:coursepilot/models/models.dart';

import 'package:http/http.dart' as http;

/// A service to interact with the backend API.
class ApiService {
  static const String _baseUrl =
      "example.com/api"; // TODO: Replace with actual base URL

  /// GET `/courses`
  ///
  /// Returns a list of course prefixes.
  Future<List<CoursePrefixListing>> getCoursePrefixes() async {
    // TODO: Implement /courses API call
    throw UnimplementedError('getCoursePrefixes is not yet implemented');
  }

  /// GET `/courses/{prefix}`
  ///
  /// Returns a list of courses associated with that prefix.
  Future<List<CourseListing>> getCoursesByPrefix(String prefix) async {
    // TODO: Implement /courses/{prefix} API call
    throw UnimplementedError('getCoursesByPrefix is not yet implemented');
  }

  /// GET `/courses/{prefix}/{number}`
  ///
  /// Returns course information.
  Future<CourseDetail> getCourseDetail(String prefix, String number) async {
    // TODO: Implement /courses/{prefix}/{number} API call
    throw UnimplementedError('getCourseDetail is not yet implemented');
  }

  /// GET `/courses/{prefix}/{number}/{semester}`
  ///
  /// Returns sections of this course in this semester.
  Future<List<SectionDetail>> getCourseSections(
    String prefix,
    String number,
    String semester,
  ) async {
    // TODO: Implement /courses/{prefix}/{number}/{semester} API call
    throw UnimplementedError('getCourseSections is not yet implemented');
  }

  /// GET `/semesters`
  ///
  /// Returns valid semesters.
  Future<List<Semester>> getSemesters() async {
    // TODO: Implement /semesters API call
    throw UnimplementedError('getSemesters is not yet implemented');
  }

  /// GET `/professor/{name}`
  ///
  /// Returns RateMyProfessors ratings for a given professor name.
  Future<ProfessorDetail> getProfessorDetail(String name) async {
    // TODO: Implement /professor/{name} API call
    throw UnimplementedError('getProfessorDetail is not yet implemented');
  }
}
