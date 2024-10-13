import 'package:tickoyako/data/models/show_model.dart';

class ShowRepository {
  Future<List<ShowModel>> fetchShows() async {
    // Mock API call or real API call with Dio
    return [
      ShowModel(
        id: '1',
        title: 'The Phantom of the Opera',
        description: 'A classic musical',
        date: DateTime.now(),
        availableSeats: ['A1', 'A2', 'A3', 'B1', 'B2'],
      ),
      // Add more mock shows
    ];
  }
}
