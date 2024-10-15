import 'package:tickoyako/data/models/show_model.dart';

class ShowRepository {
  Future<List<ShowModel>> fetchShows() async {
    // Mock API call or real API call with Dio
    return [
    ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '1',
        type: 'comedy',
        imgUrl:
            'https://m.media-amazon.com/images/M/MV5BNjExMjQ1YTctNmM0OC00YWE5LWJkNmUtNWUxOTFiNDFiMjAwXkEyXkFqcGc@._V1_.jpg',
        title: 'Kevin Hart Reality check',
        description: 'standup collective',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
  
      ),
     
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '2',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6xSuugN9pGrrh0-CG1mdRVAwoEpj1HSRVmQ&s',
        type: 'Horror',
        title: 'Annabel',
        description: 'Like The Conjuring, Annabelle is based on one of the famous cases taken on by paranormal investigators Ed and Lorraine Warren.',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
      
      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '3',
        imgUrl:
            'https://static.wikia.nocookie.net/intothebadlands/images/d/d2/Season_1_poster.png/revision/latest?cb=20170917152438',
        type: 'Movie',
        title: 'The Phantom of the Opera',
        description: 'Comedy is a genre that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium. The term originated in',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
  
      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '4',
        imgUrl:
            'https://static.wikia.nocookie.net/intothebadlands/images/d/d2/Season_1_poster.png/revision/latest?cb=20170917152438',
        type: 'Movie',
        title: 'The Phantom of the Opera',
        description: 'Comedy is a genre that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium. The term originated in',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',

      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '5',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6xSuugN9pGrrh0-CG1mdRVAwoEpj1HSRVmQ&s',
        type: 'Horror',
        title: 'Annabel',
        description:
            'Like The Conjuring, Annabelle is based on one of the famous cases taken on by paranormal investigators Ed and Lorraine Warren.',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '6',
        imgUrl:
            'https://static.wikia.nocookie.net/intothebadlands/images/d/d2/Season_1_poster.png/revision/latest?cb=20170917152438',
        type: 'Movie',
        title: 'The Phantom of the Opera',
        description: 'Comedy is a genre that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium. The term originated in',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
       
      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '7',
        imgUrl:
            'https://static.wikia.nocookie.net/intothebadlands/images/d/d2/Season_1_poster.png/revision/latest?cb=20170917152438',
        type: 'Movie',
        title: 'The Phantom of the Opera',
        description: 'Comedy is a genre that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium. The term originated in',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',

      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '8',
        imgUrl:
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6xSuugN9pGrrh0-CG1mdRVAwoEpj1HSRVmQ&s',
        type: 'Horror',
        title: 'Annabel',
        description:
            'Like The Conjuring, Annabelle is based on one of the famous cases taken on by paranormal investigators Ed and Lorraine Warren.',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '9',
        imgUrl:
            'https://static.wikia.nocookie.net/intothebadlands/images/d/d2/Season_1_poster.png/revision/latest?cb=20170917152438',
        type: 'Movie',
        title: 'The Phantom of the Opera',
        description: 'Comedy is a genre that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium. The term originated in',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
      ),
     ShowModel( price: 2000,
        contact: '+2547001111112',
        event_owner: 'marvel studios',
        id: '10',
        imgUrl:
            'https://akamaividz2.zee5.com/image/upload/w_756,h_1134,c_scale,f_webp,q_auto:eco/resources/0-0-1z5629005/portrait/1920x7707e32e06e43a94db79f6f19997e2d54bf.jpg',
        type: 'Movie',
        title: 'The signature',
        description: 'Comedy is a genre that consists of discourses or works intended to be humorous or amusing by inducing laughter, especially in theatre, film, stand-up comedy, television, radio, books, or any other entertainment medium. The term originated in',
        date: DateTime.now(),
        location: 'kenya Cultural centre (KNT)',
      ),
    ];
  }
}
