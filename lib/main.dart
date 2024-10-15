import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/data/repositories/show_repository.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_event.dart';
import 'package:tickoyako/presentation/screens/shows_screen.dart';

void main() {
  runApp(TickoyakoApp());
}

class TickoyakoApp extends StatelessWidget {
  final ShowRepository showRepository = ShowRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tickoyako',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (context) => ShowsBloc(showRepository)..add(LoadShows()),
        child: ShowListScreen(),
      ),
    );
  }
}
