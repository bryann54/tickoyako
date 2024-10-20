
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tickoyako/core/error/exceptions.dart';
class EventsApiProvider {
  final http.Client client;

  // Update the base URL to match your API endpoint
  final String baseUrl =
      'https://real-time-events-search.p.rapidapi.com'; // Replace with your actual API URL

  EventsApiProvider({required this.client});

  Future<List<dynamic>> fetchEvents(String query) async {
    try {
      print('⚡ Attempting to fetch events with query: $query'); // Debug log

      final uri = Uri.parse('$baseUrl/events?query=$query');
      print('🔗 Request URL: $uri'); // Debug log

      final response = await client.get(
        uri,
        headers: {
          'Content-Type': 'application/json',
          // Add your API key if required
          // 'Authorization': 'Bearer YOUR_API_KEY',
        },
      );

      print('📥 Response Status Code: ${response.statusCode}'); // Debug log
      print('📦 Response Body: ${response.body}'); // Debug log

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['events'] ?? [];
      } else {
        throw ServerException(
          'Server returned ${response.statusCode}: ${response.body}',
        );
      }
    } catch (e, stackTrace) {
      print('❌ Error in EventsApiProvider: $e'); // Debug log
      print('📍 Stack trace: $stackTrace'); // Debug log
      throw ServerException('API Error: $e');
    }
  }
}

