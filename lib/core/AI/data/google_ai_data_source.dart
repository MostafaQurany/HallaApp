import 'dart:convert';

import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GoogleAiDataSource {
  Future<Map<String, dynamic>> getTags(String description);
}

class GoogleAiDataSourceImpl extends GoogleAiDataSource {
  final String _apiKey = 'AIzaSyDxCEdz5RcxxGk_lnAyS0Bx1F3bPCEdbbI';

  @override
  Future<Map<String, dynamic>> getTags(String description) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: _apiKey,
      );

      final prompt =
          'under stand this description from the user and get me tags about what can he work?   all tags can u get or suggest get it to me git it in the list in arabic and english . here is the user description : $description , get me the response with just the tags with out any other messages. it should be like {"arabic":[],"english":[]}';
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);
      return _extractJobTags(response.text.toString());
    } catch (e) {
      throw e.toString();
    }
  }

  Map<String, dynamic> _extractJobTags(String input) {
    // Regular expression to match the JSON object
    final regex = RegExp(
        r'\{(?:[^{}]|"(?:\\.|[^"\\])*"|:\s*\[(?:(?:"(?:\\.|[^"\\])*"|[^,\[\]"]+)(?:,\s*(?:"(?:\\.|[^"\\])*"|[^,\[\]"]+))*?)\])*\}');

    // Find all matches in the input string
    final matches = regex.allMatches(input);

    // If matches are found, parse the first match into a Map
    if (matches.isNotEmpty) {
      final jsonString = matches.first.group(0)!; // Get the matched JSON string
      final Map<String, dynamic> jsonMap =
          json.decode(jsonString); // Parse the JSON string into a Map

      // Print the resulting Map
      return jsonMap;
    } else {
      print('No JSON found in the input string.');
      return {};
    }
  }
}
