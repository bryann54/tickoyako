import 'package:equatable/equatable.dart';

abstract class ShowsEvent extends Equatable {
  const ShowsEvent();

  @override
  List<Object> get props => [];
}

class LoadShows extends ShowsEvent {}

class SearchShows extends ShowsEvent {
  final String query;

  const SearchShows(this.query);

  @override
  List<Object> get props => [query];
}
