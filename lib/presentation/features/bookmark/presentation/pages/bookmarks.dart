import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_state.dart';
import 'package:tickoyako/presentation/widgets/bg-widget.dart';
import 'package:tickoyako/presentation/widgets/event_card_widget.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          bookmark,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.teal,
      ),
      body: AnimatedBackgroundWidget(
        child: BlocBuilder<BookmarkBloc, BookmarkState>(
          builder: (context, state) {
            if (state.bookmarkedShows.isEmpty) {
              return  Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 100,
                      child: Image.asset(
                        'assets/movie.png',
                      ),
                    ),
                    Text(
                      no_bookmarks,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: state.bookmarkedShows.length,
              itemBuilder: (context, index) {
                final show = state.bookmarkedShows[index];
                return EventCardWidget(showModel: show);
              },
            );
          },
        ),
      ),
    );
  }
}
