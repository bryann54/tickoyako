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
  final Map<String, dynamic> activeFilters;

  const ShowsLoaded(
    this.shows, {
    this.searchResults = const [],
    this.searchQuery = '',
    this.activeFilters = const {},
  });

  ShowsLoaded copyWith({
    List<ShowModel>? shows,
    List<ShowModel>? searchResults,
    String? searchQuery,
    Map<String, dynamic>? activeFilters,
  }) {
    return ShowsLoaded(
      shows ?? this.shows,
      searchResults: searchResults ?? this.searchResults,
      searchQuery: searchQuery ?? this.searchQuery,
      activeFilters: activeFilters ?? this.activeFilters,
    );
  }

  @override
  List<Object> get props => [shows, searchResults, searchQuery, activeFilters];
}

class ShowsError extends ShowsState {
  final String message;

  const ShowsError(this.message);

  @override
  List<Object> get props => [message];
}
