import 'package:equatable/equatable.dart';

abstract class ShowsEvent extends Equatable {
  const ShowsEvent();

  @override
  List<Object?> get props => [];
}

class LoadShows extends ShowsEvent {}

class SearchShows extends ShowsEvent {
  final String query;
  final Map<String, dynamic>? filters;

  const SearchShows(this.query, {this.filters});

  @override
  List<Object?> get props => [query, filters];
}

class ApplyFilters extends ShowsEvent {
  final Map<String, dynamic> filters;

  const ApplyFilters(this.filters);

  @override
  List<Object> get props => [filters];
}
