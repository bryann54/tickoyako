// bookmark_state.dart
import 'package:equatable/equatable.dart';
import 'package:tickoyako/data/models/show_model.dart';

class BookmarkState extends Equatable {
  final List<ShowModel> bookmarkedShows;

  const BookmarkState({this.bookmarkedShows = const []});

  BookmarkState copyWith({List<ShowModel>? bookmarkedShows}) {
    return BookmarkState(
      bookmarkedShows: bookmarkedShows ?? this.bookmarkedShows,
    );
  }

  @override
  List<Object> get props => [bookmarkedShows];
}
