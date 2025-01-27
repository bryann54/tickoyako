import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_state.dart';
import 'package:tickoyako/presentation/screens/event_details.dart';

class EventCardWidget extends StatefulWidget {
  const EventCardWidget({super.key, required this.showModel});
  final ShowModel showModel;

  @override
  State<EventCardWidget> createState() => _EventCardWidgetState();
}

class _EventCardWidgetState extends State<EventCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    // Create staggered animations for different elements
    _slideAnimations = List.generate(
      5, // Number of animated elements
      (index) => Tween<Offset>(
        begin: const Offset(0, -1),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1, // Stagger start times
            0.6 + (index * 0.1), // Stagger end times
            curve: Curves.easeOutBack,
          ),
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final show = widget.showModel;
    return BlocBuilder<BookmarkBloc, BookmarkState>(
      builder: (context, state) {
        state.bookmarkedShows.any((s) => s.id == show.id);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => EventDetails(show: show),
                ),
              );
            },
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade400),
                color: const Color.fromARGB(111, 158, 158, 158).withOpacity(.2),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Image with Hero animation
                        Hero(
                          tag: 'event_image_${show.id}',
                          child: ClipRRect(
                            child: SizedBox(
                              height: 150,
                              width: double.infinity,
                              child: Image.network(
                                show.imgUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              // Title and Type Row
                              SlideTransition(
                                position: _slideAnimations[0],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      show.title,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            color: Colors.teal[700],
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.teal,
                                            Colors.tealAccent
                                          ],
                                        ),
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 12, vertical: 4),
                                        child: Text(
                                          show.type.toUpperCase(),
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              // Description
                              SlideTransition(
                                position: _slideAnimations[1],
                                child: Text(
                                  show.description,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              // Schedule Row
                              SlideTransition(
                                position: _slideAnimations[2],
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        const Text(
                                          schedule_text,
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(width: 5),
                                        Text(
                                          DateFormat('MMM dd, yyyy')
                                              .format(show.date),
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              // Location and Price Row
                              SlideTransition(
                                position: _slideAnimations[3],
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          const Icon(
                                            Icons.location_on,
                                            size: 25,
                                            color: Colors.teal,
                                          ),
                                          const SizedBox(width: 1),
                                          Text(show.venue),
                                        ],
                                      ),
                                      Text(
                                        'Ksh ${NumberFormat('#,###').format(show.price)}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
