import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickoyako/core/api/api_constants.dart';
import 'package:tickoyako/core/error/exceptions.dart';

class EventsApiProvider {
  final http.Client client;

  EventsApiProvider({required this.client});

  Future<List<dynamic>> fetchEvents(String query) async {
    try {
      print('⚡ Attempting to fetch events with query: $query');

      // Properly encode the query parameter
      final encodedQuery = Uri.encodeComponent(query);
      final uri =
          Uri.parse('${ApiConstants.baseUrl}/events?query=$encodedQuery');

      print('🔗 Request URL: $uri');
      print('📤 Request Headers: ${ApiConstants.headers}');

      final response = await client.get(
        uri,
        headers: ApiConstants.headers,
      );

      print('📥 Response Status Code: ${response.statusCode}');
      print('📦 Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        // Check if the data has the expected structure
        if (data.containsKey('events')) {
          return data['events'] as List<dynamic>;
        } else {
          print('⚠️ Unexpected response structure: $data');
          return [];
        }
      } else {
        throw ServerException(
          'Server returned ${response.statusCode}: ${response.body}',
        );
      }
    } catch (e, stackTrace) {
      print('❌ Error in EventsApiProvider: $e');
      print('📍 Stack trace: $stackTrace');
      throw ServerException('API Error: $e');
    }
  }
}
