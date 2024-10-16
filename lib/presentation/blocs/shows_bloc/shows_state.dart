import 'package:equatable/equatable.dart';
import 'package:tickoyako/data/models/show_model.dart';

abstract class ShowsState extends Equatable {
  const ShowsState();

  @override
  List<Object> get props => [];
}

class ShowsInitial extends ShowsState {}

class ShowsLoading extends ShowsState {}

class ShowsLoaded extends ShowsState {
  final List<ShowModel> shows;
  final List<ShowModel> searchResults;
  final String searchQuery;

  const ShowsLoaded(
    this.shows, {
    this.searchResults = const [],
    this.searchQuery = '',
  });

  ShowsLoaded copyWith({
    List<ShowModel>? shows,
    List<ShowModel>? searchResults,
    String? searchQuery,
  }) {
    return ShowsLoaded(
      shows ?? this.shows,
      searchResults: searchResults ?? this.searchResults,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  @override
  List<Object> get props => [shows, searchResults, searchQuery];
}

class ShowsError extends ShowsState {
  final String message;

  const ShowsError(this.message);

  @override
  List<Object> get props => [message];
}
