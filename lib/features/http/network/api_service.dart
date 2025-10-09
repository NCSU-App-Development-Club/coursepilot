import 'package:coursepilot/features/http/network/http_client.dart';
import 'package:coursepilot/features/http/config/api_config.dart';
import 'package:coursepilot/models/course.dart';

/// Core service for fetching from
class ApiService {
  /// Fetches a list of `Course`s
  static Future<List<Course>> fetchCourses() async {
    final response = await httpClient.get(ApiRoutes.coursesEndpoint);
    final List<dynamic> data = response.data as List<dynamic>;

    return data
        .map((json) => CourseMapper.fromMap(json as Map<String, dynamic>))
        .toList();
  }
}
