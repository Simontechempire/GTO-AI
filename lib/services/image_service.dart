import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageService {
  static const String apiUrl = 'YOUR_BACKEND_URL/image';

  static Future<String> generateImage(String prompt) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'prompt': prompt,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return data['imageUrl'] ?? '';
      }

      return '';
    } catch (e) {
      return '';
    }
  }
}
