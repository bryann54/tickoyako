// bookmark_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'bookmark_event.dart';
import 'bookmark_state.dart';

class BookmarkBloc extends Bloc<BookmarkEvent, BookmarkState> {
  BookmarkBloc() : super(const BookmarkState()) {
    on<AddBookmark>(_onAddBookmark);
    on<RemoveBookmark>(_onRemoveBookmark);
  }

  void _onAddBookmark(AddBookmark event, Emitter<BookmarkState> emit) {
    final updatedBookmarks = List<ShowModel>.from(state.bookmarkedShows)
      ..add(event.show);
    emit(state.copyWith(bookmarkedShows: updatedBookmarks));
  }

  void _onRemoveBookmark(RemoveBookmark event, Emitter<BookmarkState> emit) {
    final updatedBookmarks = List<ShowModel>.from(state.bookmarkedShows)
      ..removeWhere((show) => show.id == event.show.id);
    emit(state.copyWith(bookmarkedShows: updatedBookmarks));
  }
}
