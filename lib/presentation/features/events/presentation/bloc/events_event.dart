part of 'events_bloc.dart';
abstract class EventsEvent {}

class FetchEvents extends EventsEvent {
  final String query;
  FetchEvents(this.query);
}
