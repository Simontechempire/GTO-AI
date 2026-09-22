import 'dart:convert';
import 'package:http/http.dart' as http;

class SearchService {
  static const String apiUrl = 'YOUR_BACKEND_URL/search';

  static Future<String> search(String query) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'query': query,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['result'] ?? 'No result found.';
      }

      return 'Search failed.';
    } catch (e) {
      return 'Unable to connect to search service.';
    }
  }
}
