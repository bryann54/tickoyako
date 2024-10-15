// lib/features/home_screen/bloc/home_screen_state.dart
import 'package:equatable/equatable.dart';
import 'package:tickoyako/presentation/features/home_screen/data/models/category_model.dart';

abstract class HomeScreenState extends Equatable {
  const HomeScreenState();

  @override
  List<Object> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<Category> categories;

  const HomeScreenLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class HomeScreenError extends HomeScreenState {
  final String message;

  const HomeScreenError(this.message);

  @override
  List<Object> get props => [message];
}
