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

class ShowListScreen extends StatelessWidget {
  const ShowListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingBottomNavBar(
      children: [
        _buildMainContent(),
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
            backgroundColor: Colors.teal, // Keep the teal background consistent
            flexibleSpace: FlexibleSpaceBar(
              title: const Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    home_tittle,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 8),
                  CustomSearchBar(),
                ],
              ),
              titlePadding:
                  const EdgeInsets.only(left: 16, right: 16, bottom: 16),
              background:
                  Container(color: Colors.teal), // Ensure teal color remains
              stretchModes: const [
                StretchMode.fadeTitle,
              ],
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
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final show = state.shows[index];
                        return EventCardWidget(showModel: show);
                      },
                      childCount: state.shows.length,
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
