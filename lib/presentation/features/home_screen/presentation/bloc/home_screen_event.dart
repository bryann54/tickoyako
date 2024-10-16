import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();

  @override
  List<Object> get props => [];
}

class LoadCategories extends HomeScreenEvent {}

class SearchCategories extends HomeScreenEvent {
  final String query;

  const SearchCategories(this.query);

  @override
  List<Object> get props => [query];
}
