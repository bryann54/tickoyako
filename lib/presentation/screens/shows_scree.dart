import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_state.dart';
import 'package:tickoyako/presentation/widgets/seat_map_widget.dart';

class ShowListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Theatre Shows')),
      body: BlocBuilder<ShowsBloc, ShowsState>(
        builder: (context, state) {
          if (state is ShowsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is ShowsLoaded) {
            return ListView.builder(
              itemCount: state.shows.length,
              itemBuilder: (context, index) {
                final show = state.shows[index];
                return ListTile(
                  title: Text(show.title),
                  subtitle: Text(show.description),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SeatSelectionScreen(show: show),
                    ),
                  ),
                );
              },
            );
          } else if (state is ShowsError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text('No shows available'));
        },
      ),
    );
  }
}

class SeatSelectionScreen extends StatelessWidget {
  final ShowModel show;

  SeatSelectionScreen({required this.show});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Seat for ${show.title}')),
      body: SeatMapWidget(
        availableSeats: show.availableSeats,
        onSeatSelected: (seat) {
          // Handle seat selection
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Seat $seat selected')),
          );
        },
      ),
    );
  }
}
