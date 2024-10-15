// lib/features/home_screen/widgets/search_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/home_screen_bloc.dart';
import '../bloc/home_screen_event.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search categories...',
          prefixIcon: Icon(Icons.search,color: Colors.black,),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        onChanged: (query) {
          context.read<HomeScreenBloc>().add(SearchCategories(query));
        },
      ),
    );
  }
}
