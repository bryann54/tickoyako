import 'package:tickoyako/data/models/show_model.dart';

class ShowRepository {
  Future<List<ShowModel>> fetchShows() async {
    // Mock API call or real API call with Dio
    return [
      ShowModel(
        id: '1',
        type: 'comedy',
        imgUrl:
            'https://m.media-amazon.com/images/M/MV5BNjExMjQ1YTctNmM0OC00YWE5LWJkNmUtNWUxOTFiNDFiMjAwXkEyXkFqcGc@._V1_.jpg',
        title: 'Kevin Hart Reality check',
        description: 'standup collective',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
  
      ),
      ShowModel(
        id: '1',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6xSuugN9pGrrh0-CG1mdRVAwoEpj1HSRVmQ&s',
        type: 'Horror',
        title: 'Annabel',
        description: 'Like The Conjuring, Annabelle is based on one of the famous cases taken on by paranormal investigators Ed and Lorraine Warren.',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
      
      ),
      ShowModel(
        id: '1',
        imgUrl:
            'https://static.wikia.nocookie.net/intothebadlands/images/d/d2/Season_1_poster.png/revision/latest?cb=20170917152438',
        type: 'Movie',
        title: 'The Phantom of the Opera',
        description: 'A classic musical',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
  
      ),
      ShowModel(
        id: '1',
        imgUrl:
            'https://static.wikia.nocookie.net/intothebadlands/images/d/d2/Season_1_poster.png/revision/latest?cb=20170917152438',
        type: 'Movie',
        title: 'The Phantom of the Opera',
        description: 'A classic musical',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',

      ),
    ];
  }
}
