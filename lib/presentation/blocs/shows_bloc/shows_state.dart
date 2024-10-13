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

  const ShowsLoaded(this.shows);

  @override
  List<Object> get props => [shows];
}

class ShowsError extends ShowsState {
  final String message;

  const ShowsError(this.message);

  @override
  List<Object> get props => [message];
}
