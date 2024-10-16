import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/core/strings.dart';
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Container(
            height: 30,
            decoration: BoxDecoration(
               color: Colors.teal[50],
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: TextField(
              controller: _searchController,
              onChanged: (query) => _onSearchChanged(context, query),
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
              ),
              decoration: InputDecoration(
                hintText: search_text,
                hintStyle: const TextStyle(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.black12,
                ),
                prefixIcon: Icon(Icons.search, color: Colors.teal.shade100,size: 27,),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: Icon(Icons.clear, color: Colors.teal.shade700),
                        onPressed: () {
                          setState(() {
                            _searchController.clear();
                          });
                          context.read<ShowsBloc>().add(SearchShows(''));
                        },
                      )
                    : null,
                border: InputBorder.none,
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            // Implement filter functionality
          },
          child: Container(
            height: 30,
            width: 30,
            decoration: BoxDecoration(
              color: Colors.teal[50],
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: const Icon(
              Icons.tune,
              color: Colors.black38,
              size: 18,
            ),
          ),
        ),
      ],
    );
  }
}
