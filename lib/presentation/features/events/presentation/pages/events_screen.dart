import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/presentation/features/events/presentation/bloc/events_bloc.dart';
class EventsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events'),
      ),
      body: BlocListener<EventsBloc, EventsState>(
        listener: (context, state) {
          if (state is EventsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: Colors.red,
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: () {
                    context
                        .read<EventsBloc>()
                        .add(FetchEvents('concerts in san-francisco'));
                  },
                ),
              ),
            );
          }
        },
        child: BlocBuilder<EventsBloc, EventsState>(
          builder: (context, state) {
            if (state is EventsLoading) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(height: 16),
                    Text('Loading events...'),
                  ],
                ),
              );
            } else if (state is EventsLoaded) {
              return state.events.isEmpty
                  ? Center(child: Text('No events found'))
                  : ListView.builder(
                      itemCount: state.events.length,
                      itemBuilder: (context, index) {
                        final event = state.events[index];
                        return Card(
                          margin: EdgeInsets.all(8),
                          child: ListTile(
                            title: Text(event.name),
                            subtitle: Text(event.venue),
                            trailing: Text(event.startTime),
                          ),
                        );
                      },
                    );
            } else if (state is EventsError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error_outline, size: 48, color: Colors.red),
                    SizedBox(height: 16),
                    Text(
                      'Error loading events',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    SizedBox(height: 8),
                    Text(
                      state.message,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.red),
                    ),
                    SizedBox(height: 16),
                    ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<EventsBloc>()
                            .add(FetchEvents('concerts in san-francisco'));
                      },
                      icon: Icon(Icons.refresh),
                      label: Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            return Center(child: Text('Search for events'));
          },
        ),
      ),
     
    );
  }
}
