import 'package:equatable/equatable.dart';

abstract class ShowsEvent extends Equatable {
  const ShowsEvent();

  @override
  List<Object> get props => [];
}

class LoadShows extends ShowsEvent {}
