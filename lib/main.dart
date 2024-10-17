import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tickoyako/core/theme/app_theme.dart';
import 'package:tickoyako/core/theme/theme_controller.dart';
import 'package:tickoyako/data/repositories/show_repository.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_event.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:tickoyako/presentation/screens/shows_screen.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeController(),
      child: TickoyakoApp(),
    ),
  );
}

class TickoyakoApp extends StatelessWidget {
  final ShowRepository showRepository = ShowRepository();

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeController>(
      builder: (context, themeController, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => ShowsBloc(showRepository)..add(LoadShows()),
            ),
            BlocProvider(
              create: (context) => BookmarkBloc(),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode,
            home: ShowListScreen(),
          ),
        );
      },
    );
  }
}
