
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../error/exceptions.dart';
import 'api_constants.dart';

class ApiProvider {
  final http.Client client;

  ApiProvider(this.client);

  Future<dynamic> get(String endpoint) async {
    try {
      final response = await client.get(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: ApiConstants.headers,
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw ServerException('Server error occurred: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<dynamic> post(String endpoint, {Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(
        Uri.parse('${ApiConstants.baseUrl}$endpoint'),
        headers: ApiConstants.headers,
        body: json.encode(body),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return json.decode(response.body);
      } else {
        throw ServerException('Server error occurred: ${response.statusCode}');
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
