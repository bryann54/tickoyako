import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_bloc.dart';
import 'package:tickoyako/presentation/blocs/shows_bloc/shows_state.dart';
import 'package:intl/intl.dart';
import 'package:tickoyako/presentation/screens/seat_selection.dart';

class ShowListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Upcoming Shows')),
      body: BlocBuilder<ShowsBloc, ShowsState>(
        builder: (context, state) {
          if (state is ShowsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ShowsLoaded) {
            return ListView.builder(
              itemCount: state.shows.length,
              itemBuilder: (context, index) {
                final show = state.shows[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade400)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: SizedBox(
                            height: 150, // Adjust the height of the image
                            width: 120, // Adjust the width of the image
                            child: Image.network(
                              show.imgUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(
                            width: 10), // Space between the image and text
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                show.title,
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                show.description,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey[600],
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Row(
                                children: [
                                  Text(
                                    'On',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    DateFormat('MMM dd, yyyy').format(show
                                        .date), // Format the date to 'Month Day, Year'
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey[600],
                                    ),
                                    maxLines:
                                        1, // No need for 3 lines here since it's just a date
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    width: 70,
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.blue),
                                        borderRadius:
                                            BorderRadius.circular(15)),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          10, 4, 10, 4),
                                      child: Text(
                                        show.type,
                                        style: const TextStyle(
                                            fontSize: 12, color: Colors.blue),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: Colors.blue,
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Text(show.location),
                                    const SizedBox(
                                      width: 25,
                                    ),
                                    const Icon(
                                      Icons.bookmark_border,
                                      color: Colors.blue,
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              SeatSelectionScreen(show: show),
                                        ),
                                      ),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color:
                                                      Colors.blueGrey.shade200),
                                              borderRadius:
                                                  BorderRadius.circular(15)),
                                          height: 40,
                                          child: const Center(
                                              child: Text('View Seats'))),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.black,
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        height: 40,
                                        child: const Center(
                                            child: Text(
                                          'Book Seats',
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
