import 'package:bloc/bloc.dart';
import 'package:tickoyako/presentation/features/events/data/models/event_model.dart';
import 'package:tickoyako/presentation/features/events/data/repositories/events_repository.dart';

part 'events_event.dart';
part 'events_state.dart';
class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventsRepository repository;

  EventsBloc({required this.repository}) : super(EventsInitial()) {
    on<FetchEvents>((event, emit) async {
      try {
        print('🎬 Bloc: Starting to fetch events'); // Debug log
        emit(EventsLoading());

        print(
            '🔍 Bloc: Calling repository with query: ${event.query}'); // Debug log
        final events = await repository.getEvents(event.query);

        print(
            '✅ Bloc: Successfully fetched ${events.length} events'); // Debug log
        emit(EventsLoaded(events));
      } catch (e, stackTrace) {
        print('❌ Error in EventsBloc: $e'); // Debug log
        print('📍 Stack trace: $stackTrace'); // Debug log
        emit(EventsError(e.toString()));
      }
    });
  }
}

