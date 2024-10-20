import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:tickoyako/presentation/features/bookmark/presentation/bloc/bookmark_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/presentation/screens/seat_selection.dart';
import 'package:tickoyako/presentation/widgets/book_ticket_widget.dart';

class EventDetails extends StatelessWidget {
  final ShowModel show;

  const EventDetails({Key? key, required this.show}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

    final isBookmarked = context.select<BookmarkBloc, bool>(
        (bloc) => bloc.state.bookmarkedShows.contains(show));

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300,
            floating: false,
            pinned: true,
            backgroundColor: isLightMode
                ? AppColors.primaryColor
                : AppColors.primaryColorDark,
            iconTheme: IconThemeData(
                color: isLightMode
                    ? AppColors.secondaryColor
                    : AppColors.secondaryColorDark),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                'Event Details',
                style: TextStyle(
                    color: isLightMode
                        ? AppColors.secondaryColor
                        : AppColors.secondaryColorDark,
                    fontWeight: FontWeight.bold),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'event_image_${show.id}',
                    child: Image.network(
                      show.imgUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: isLightMode
                          ? AppColors.typeGradient
                          : AppColors.darkTypeGradient,
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(
                icon: Icon(
                  isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  color: isLightMode
                      ? AppColors.secondaryColor
                      : AppColors.secondaryColorDark,
                  size: isBookmarked ? 40 : 35,
                ),
                onPressed: () {
                  context.read<BookmarkBloc>().add(
                        isBookmarked ? RemoveBookmark(show) : AddBookmark(show),
                      );
                },
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          show.title,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            color: isLightMode
                                ? AppColors.textPrimary
                                : AppColors.textPrimaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          gradient: isLightMode
                              ? AppColors.lightButtonGradient
                              : AppColors.darkButtonGradient,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          child: Text(
                            show.type.toUpperCase(),
                            style: TextStyle(
                              fontSize: 12,
                              color: isLightMode
                                  ? AppColors.textPrimary
                                  : AppColors.textPrimaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Card(
                    elevation: 2,
                    color: isLightMode
                        ? AppColors.surface
                        : AppColors.surfaceColorDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(
                        color: isLightMode
                            ? AppColors.primaryColor
                            : AppColors.primaryColorDark,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(context, Icons.calendar_today, 'Date',
                              DateFormat('MMM dd, yyyy').format(show.date)),
                          _buildInfoRow(
                              context, Icons.location_on, 'venue', show.venue),
                          _buildInfoRow(
                              context, Icons.phone, 'Contact', show.contact),
                          _buildInfoRow(context, Icons.attach_money, 'Price',
                              'Ksh ${NumberFormat('#,###').format(show.price)}'),
                          _buildInfoRow(context, Icons.person, event_owner,
                              show.event_owner),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    description,
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: isLightMode
                          ? AppColors.textPrimary
                          : AppColors.textPrimaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    show.description,
                    style: theme.textTheme.bodyLarge?.copyWith(
                      color: isLightMode
                          ? AppColors.textSecondary
                          : AppColors.textSecondaryDark,
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isLightMode ? AppColors.surface : AppColors.surfaceColorDark,
          boxShadow: [
            BoxShadow(
              color: (isLightMode ? Colors.grey : Colors.white)
                  .withOpacity(isLightMode ? 0.3 : 0.1),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, -3),
            ),
          ],
        ),
        child: Row(
          children: [
            Expanded(
              child: Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(10),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: isLightMode
                        ? AppColors.darkButtonGradient
                        : AppColors.darkButtonGradient,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SeatSelectionScreen(show: show),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.event_seat,
                              color: isLightMode
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryDark),
                          const SizedBox(width: 8),
                          Text(
                            'View Seats',
                            style: TextStyle(
                              color: isLightMode
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const BookTicketWidget(),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(
      BuildContext context, IconData icon, String label, String value) {
    final theme = Theme.of(context);
    final isLightMode = theme.brightness == Brightness.light;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon,
              size: 20,
              color: isLightMode
                  ? AppColors.primaryColor
                  : AppColors.primaryColorDark),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isLightMode
                  ? AppColors.textPrimary
                  : AppColors.textPrimaryDark,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                color: isLightMode
                    ? AppColors.textSecondary
                    : AppColors.textSecondaryDark,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
