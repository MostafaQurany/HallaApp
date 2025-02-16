import 'package:google_generative_ai/google_generative_ai.dart';

abstract class GoogleAiDataSource {
  Future<String> getTags(String description);
}

class GoogleAiDataSourceImpl extends GoogleAiDataSource {
  final String _apiKey = 'AIzaSyDgUR6Jtq3UPTeB0T2FoEqm3pLPl4chE74';

  @override
  Future<String> getTags(String description) async {
    try {
      final model = GenerativeModel(
        model: 'gemini-1.5-flash-latest',
        apiKey: _apiKey,
      );

      final prompt =
          'under stand this description from the user and get me tags about what can he work?   all tags can u get or suggest get it to me git it in the list . here is the user description : $description , get me the response with just the tags with out any other messages.';
      final content = [Content.text(prompt)];
      final response = await model.generateContent(content);

      return response.text.toString();
    } catch (e) {
      throw e.toString();
    }
  }
}
