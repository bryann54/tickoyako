import 'package:equatable/equatable.dart';
import 'package:tickoyako/data/models/show_model.dart';

abstract class BookmarkEvent extends Equatable {
  const BookmarkEvent();

  @override
  List<Object> get props => [];
}

class AddBookmark extends BookmarkEvent {
  final ShowModel show;

  const AddBookmark(this.show);

  @override
  List<Object> get props => [show];
}

class RemoveBookmark extends BookmarkEvent {
  final ShowModel show;

  const RemoveBookmark(this.show);

  @override
  List<Object> get props => [show];
}
