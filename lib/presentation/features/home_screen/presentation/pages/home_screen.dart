// lib/features/home_screen/home_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/presentation/features/home_screen/presentation/bloc/home_screen_bloc.dart';
import 'package:tickoyako/presentation/features/home_screen/presentation/bloc/home_screen_event.dart';
import 'package:tickoyako/presentation/features/home_screen/presentation/bloc/home_screen_state.dart';
import 'package:tickoyako/presentation/features/home_screen/presentation/widgets/category_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenBloc()..add(LoadCategories()),
      child: Scaffold(
        appBar: AppBar(title: Text('Home')),
        body: Column(
          children: [
            SearchBar(),
            SizedBox(height: 10,),
            Expanded(
              child: BlocBuilder<HomeScreenBloc, HomeScreenState>(
                builder: (context, state) {
                  if (state is HomeScreenLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is HomeScreenLoaded) {
                    return CategoryList(categories: state.categories);
                  } else if (state is HomeScreenError) {
                    return Center(child: Text(state.message));
                  }
                  return Center(child: Text('Something went wrong'));
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
