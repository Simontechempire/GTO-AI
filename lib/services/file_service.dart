import 'dart:io';

class FileService {
  static Future<String> readFile(File file) async {
    try {
      return await file.readAsString();
    } catch (e) {
      return 'Unable to read file.';
    }
  }
}
