// custom_search_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_event.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();
  Timer? _debounce;

  @override
  void dispose() {
    _searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(BuildContext context, String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      context.read<ShowsBloc>().add(SearchShows(query));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: Container(
            height: 35,
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(25),
            ),
            alignment: Alignment.center,
            child: TextField(
              controller: _searchController,
              onChanged: (query) => _onSearchChanged(context, query),
              decoration: const InputDecoration(
                hintText: 'Search by events',
                hintStyle: TextStyle(color: Colors.black38, fontSize: 14),
                prefixIcon: Icon(Icons.search, color: Colors.black38),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 8),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(5, 8, 0, 8),
          child: GestureDetector(
            onTap: () {
              // Implement filter functionality
            },
            child: Container(
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.white60,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.tune, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
