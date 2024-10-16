import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'package:tickoyako/data/repositories/show_repository.dart';
import 'shows_event.dart';
import 'shows_state.dart';

class ShowsBloc extends Bloc<ShowsEvent, ShowsState> {
  final ShowRepository showRepository;

  ShowsBloc(this.showRepository) : super(ShowsInitial()) {
    on<LoadShows>(_onLoadShows);
    on<SearchShows>(_onSearchShows);
    on<ApplyFilters>(_onApplyFilters);
  }

  Future<void> _onLoadShows(LoadShows event, Emitter<ShowsState> emit) async {
    emit(ShowsLoading());
    try {
      final shows = await showRepository.fetchShows();
      emit(ShowsLoaded(shows));
    } catch (e) {
      emit(const ShowsError('Failed to load shows'));
    }
  }

  Future<void> _onSearchShows(
      SearchShows event, Emitter<ShowsState> emit) async {
    if (state is ShowsLoaded) {
      final currentState = state as ShowsLoaded;
      final filters = event.filters ?? currentState.activeFilters;

      if (event.query.isEmpty && filters.isEmpty) {
        emit(ShowsLoaded(
          currentState.shows,
          searchResults: currentState.shows,
          searchQuery: '',
          activeFilters: filters,
        ));
        return;
      }

      var filteredShows = currentState.shows;

      // Apply search query
      if (event.query.isNotEmpty) {
        filteredShows = filteredShows.where((show) {
          final query = event.query.toLowerCase();
          return show.title.toLowerCase().contains(query) ||
              show.type.toLowerCase().contains(query) ||
              show.venue.toLowerCase().contains(query) ||
              show.description.toLowerCase().contains(query);
        }).toList();
      }

      // Apply filters
      if (filters.isNotEmpty) {
        filteredShows = _applyFiltersToShows(filteredShows, filters);
      }

      emit(ShowsLoaded(
        currentState.shows,
        searchResults: filteredShows,
        searchQuery: event.query,
        activeFilters: filters,
      ));
    }
  }

  Future<void> _onApplyFilters(
      ApplyFilters event, Emitter<ShowsState> emit) async {
    if (state is ShowsLoaded) {
      final currentState = state as ShowsLoaded;
      final filteredShows = _applyFiltersToShows(
        currentState.searchQuery.isEmpty
            ? currentState.shows
            : currentState.searchResults,
        event.filters,
      );

      emit(ShowsLoaded(
        currentState.shows,
        searchResults: filteredShows,
        searchQuery: currentState.searchQuery,
        activeFilters: event.filters,
      ));
    }
  }

  List<ShowModel> _applyFiltersToShows(
      List<ShowModel> shows, Map<String, dynamic> filters) {
    return shows.where((show) {
      // Category filter
      if (filters['categories'] != null && filters['categories'].isNotEmpty) {
        if (!filters['categories'].contains(show.type)) {
          return false;
        }
      }

      // Price filter
      if (filters['minPrice'] != null && filters['maxPrice'] != null) {
        final price = show.price;
        if (price < filters['minPrice'] || price > filters['maxPrice']) {
          return false;
        }
      }

      // Date filter
      if (filters['date'] != null) {
        final filterDate = filters['date'] as DateTime;
        if (!_isSameDay(show.date, filterDate)) {
          return false;
        }
      }

      // Location filter
      if (filters['location'] != null && filters['location'].isNotEmpty) {
        if (show.venue.toLowerCase() != filters['location'].toLowerCase()) {
          return false;
        }
      }

      return true;
    }).toList();
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
