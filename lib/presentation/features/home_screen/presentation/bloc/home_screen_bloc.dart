// lib/features/home_screen/bloc/home_screen_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/presentation/features/home_screen/data/models/category_model.dart';
import './home_screen_event.dart';
import './home_screen_state.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<LoadCategories>(_onLoadCategories);
    on<SearchCategories>(_onSearchCategories);
  }

  void _onLoadCategories(
      LoadCategories event, Emitter<HomeScreenState> emit) async {
    emit(HomeScreenLoading());
    try {
      // Simulate API call
      await Future.delayed(Duration(seconds: 1));
      final categories = [
        Category(
            id: '1',
            name: 'Electronics',
            imageUrl:
                'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/2e80767e-a234-406a-846f-f6c7d68d40e1/dcr8tfy-d2ee95f6-9006-49cb-a4ed-5e12c5bc6882.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcLzJlODA3NjdlLWEyMzQtNDA2YS04NDZmLWY2YzdkNjhkNDBlMVwvZGNyOHRmeS1kMmVlOTVmNi05MDA2LTQ5Y2ItYTRlZC01ZTEyYzViYzY4ODIucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.naSCxV5y7Hu278Xl90AaPn1bA5a9HIyU6xBdZl6yWPM'),
        Category(
            id: '2',
            name: 'Clothing',
            imageUrl:
                'https://www.shutterstock.com/image-vector/theater-theatre-drama-comedy-tragedy-600nw-2223832025.jpg'),
        Category(
            id: '3',
            name: 'Books',
            imageUrl:
                'https://as2.ftcdn.net/v2/jpg/02/45/39/57/1000_F_245395748_NvGDbXUgWRyxI4s0QmcVKbfgx0S2xmpB.jpg'),
        // Add more categories as needed
      ];
      emit(HomeScreenLoaded(categories));
    } catch (e) {
      emit(HomeScreenError('Failed to load categories'));
    }
  }

  void _onSearchCategories(
      SearchCategories event, Emitter<HomeScreenState> emit) {
    if (state is HomeScreenLoaded) {
      final loadedState = state as HomeScreenLoaded;
      final filteredCategories = loadedState.categories
          .where((category) =>
              category.name.toLowerCase().contains(event.query.toLowerCase()))
          .toList();
      emit(HomeScreenLoaded(filteredCategories));
    }
  }
}
