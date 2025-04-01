import 'package:http/http.dart' as http;

class APIClient {
  static const _baseURL = "example.com";
  static const _semestersEndpoint = "/semesters";

  static Future<String> getSemesters() async {
    final Uri uri = Uri.https(_baseURL, _semestersEndpoint);
    final http.Response response = await http.get(uri);
    return response.body;
  }

  static Future<String> getCourse(String semester, String course, [String? name]) async {
    final Uri uri;
    if (name == null) {
      uri = Uri.https(_baseURL, "/$semester/$course");
    } else {
      uri = Uri.https(_baseURL, "/$semester/$course", {"name":name});
    }

    final http.Response response = await http.get(uri);
    return response.body;
  }

  static Future<String> getSection( String semester, String course, String section) async {
    final Uri uri = Uri.https(_baseURL, "/$semester/$course/$section");
    final http.Response response = await http.get(uri);
    return response.body;
  }
}
