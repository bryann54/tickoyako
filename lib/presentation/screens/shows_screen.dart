import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_state.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/pages/bookmarks.dart';
import 'package:tickoyako/presentation/features/profile/presentation/pages/profile_screen.dart';
import 'package:tickoyako/presentation/widgets/event_card_widget.dart';
import 'package:tickoyako/presentation/widgets/floating_bottom_nav_bar.dart';
import 'package:tickoyako/presentation/widgets/search_bar_widget.dart';

class ShowListScreen extends StatefulWidget {
  const ShowListScreen({super.key});

  @override
  State<ShowListScreen> createState() => _ShowListScreenState();
}

class _ShowListScreenState extends State<ShowListScreen> {
  @override
  Widget build(BuildContext context) {
    return FloatingBottomNavBar(
      children: [
        _buildMainContent(), // Main content wrapped in a function
        Bookmarks(),
        ProfileScreen(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true,
            expandedHeight: 160.0,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    home_tittle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const CustomSearchBar(),
                ],
              ),
              titlePadding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              background: Container(color: Colors.teal),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(top: 8.0),
            sliver: BlocBuilder<ShowsBloc, ShowsState>(
              builder: (context, state) {
                if (state is ShowsLoading) {
                  return const SliverFillRemaining(
                    child: Center(child: CircularProgressIndicator.adaptive()),
                  );
                } else if (state is ShowsLoaded) {
                  final shows = state.searchQuery.isEmpty
                      ? state.shows
                      : state.searchResults;

                  if (shows.isEmpty && state.searchQuery.isNotEmpty) {
                    return const SliverFillRemaining(
                      child: Center(child: Text('No matching events found')),
                    );
                  }

                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final show = shows[index];
                        return EventCardWidget(showModel: show);
                      },
                      childCount: shows.length,
                    ),
                  );
                } else if (state is ShowsError) {
                  return SliverFillRemaining(
                    child: Center(child: Text(state.message)),
                  );
                }
                return const SliverFillRemaining(
                  child: Center(child: Text(no_shows)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
