import 'package:tickoyako/core/error/exceptions.dart';
import 'package:tickoyako/presentation/features/events/data/datasources/events_api_provider.dart';

import '../models/event_model.dart';

class EventsRepository {
  final EventsApiProvider apiProvider;

  EventsRepository({required this.apiProvider});

  Future<List<Event>> getEvents(String query) async {
    try {
      final response = await apiProvider.fetchEvents(query);
      return response.map((json) => Event.fromJson(json)).toList();
    } catch (e) {
      print('Repository Error: $e');
      throw ServerException('Failed to fetch events: $e');
    }
  }
}

