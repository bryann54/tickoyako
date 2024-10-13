import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/data/repositories/show_repository.dart';
import 'shows_event.dart';
import 'shows_state.dart';

class ShowsBloc extends Bloc<ShowsEvent, ShowsState> {
  final ShowRepository showRepository;

  ShowsBloc(this.showRepository) : super(ShowsInitial()) {
    on<LoadShows>(_onLoadShows);
  }

  Future<void> _onLoadShows(LoadShows event, Emitter<ShowsState> emit) async {
    emit(ShowsLoading());
    try {
      final shows = await showRepository.fetchShows();
      emit(ShowsLoaded(shows));
    } catch (e) {
      emit(ShowsError('Failed to load shows'));
    }
  }
}
