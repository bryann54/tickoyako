// shows_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/data/repositories/show_repository.dart';
import 'shows_event.dart';
import 'shows_state.dart';

class ShowsBloc extends Bloc<ShowsEvent, ShowsState> {
  final ShowRepository showRepository;

  ShowsBloc(this.showRepository) : super(ShowsInitial()) {
    on<LoadShows>(_onLoadShows);
    on<SearchShows>(_onSearchShows);
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

      if (event.query.isEmpty) {
        emit(ShowsLoaded(
          currentState.shows,
          searchResults: currentState.shows,
          searchQuery: '',
        ));
        return;
      }

      final searchResults = currentState.shows.where((show) {
        final query = event.query.toLowerCase();
        return show.title.toLowerCase().contains(query) ||
            show.type.toLowerCase().contains(query) ||
            show.location.toLowerCase().contains(query) ||
            show.description.toLowerCase().contains(query);
      }).toList();

      emit(ShowsLoaded(
        currentState.shows,
        searchResults: searchResults,
        searchQuery: event.query,
      ));
    }
  }
}
