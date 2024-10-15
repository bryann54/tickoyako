import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_state.dart';
import 'package:tickoyako/presentation/widgets/event_card_widget.dart';

class ShowListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text('Upcoming Shows'.toUpperCase(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 16,),),
      backgroundColor: Colors.blue,
      ),
      body: BlocBuilder<ShowsBloc, ShowsState>(
        builder: (context, state) {
          if (state is ShowsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ShowsLoaded) {
            return ListView.builder(
              itemCount: state.shows.length,
              itemBuilder: (context, index) {
                final show = state.shows[index];
                return EventCardWidget(showModel: show); },
            );
          } else if (state is ShowsError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No shows available'));
        },
      ),
    );
  }
}
