class Event {
  final String eventId;
  final String name;
  final String description;
  final String startTime;
  final String venue;

  Event({
    required this.eventId,
    required this.name,
    required this.description,
    required this.startTime,
    required this.venue,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    try {
      return Event(
        eventId: json['id']?.toString() ?? '',
        name: json['name']?.toString() ?? 'No Name',
        description: json['description']?.toString() ?? 'No Description',
        startTime: json['datetime']?.toString() ?? 'No Time',
        venue: json['venue']?['name']?.toString() ?? 'No Venue',
      );
    } catch (e) {
      print('Error parsing event JSON: $e');
      print('Problematic JSON: $json');
      rethrow;
    }
  }
}
