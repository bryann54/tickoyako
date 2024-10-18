// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'package:tickoyako/core/theme/app_theme.dart';
import 'package:tickoyako/core/theme/theme_controller.dart';
import 'package:tickoyako/data/repositories/show_repository.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_event.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:tickoyako/presentation/features/events/data/datasources/events_api_provider.dart';
import 'package:tickoyako/presentation/features/events/data/repositories/events_repository.dart';
import 'package:tickoyako/presentation/features/events/presentation/bloc/events_bloc.dart';
import 'package:tickoyako/presentation/features/events/presentation/pages/events_screen.dart';

void main() {
  final http.Client httpClient = http.Client();
  final eventsApiProvider = EventsApiProvider(client: httpClient);
  final eventsRepository = EventsRepository(apiProvider: eventsApiProvider);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ThemeController(),
        ),
        // Specify the type explicitly
        Provider<EventsRepository>(
          create: (_) => eventsRepository,
        ),
      ],
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
            BlocProvider(
              create: (context) => EventsBloc(
                repository: context.read<EventsRepository>(),
              )..add(FetchEvents(
                  'concerts in san-francisco')), // Initialize with events fetch
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeController.themeMode,
            home: EventsScreen(),
          ),
        );
      },
    );
  }
}
