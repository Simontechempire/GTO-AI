import 'dart:convert';
import 'package:http/http.dart' as http;

class AIService {
  static const String apiUrl =
      'https://gto-ai-1.onrender.com/chat';

  static Future<String> sendMessage(String message) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          'message': message,
        }),
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        return data['response'] ??
            'GTO did not return a response.';
      }

      return 'GTO server error: ${response.statusCode}';
    } catch (e) {
      return 'Unable to connect to GTO AI.';
    }
  }
}
