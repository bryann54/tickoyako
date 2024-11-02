import 'package:flutter/material.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'package:tickoyako/presentation/widgets/bg-widget.dart';
import 'package:tickoyako/presentation/widgets/theater_seating_layout.dart';

class SeatSelectionScreen extends StatefulWidget {
  final ShowModel show;

  SeatSelectionScreen({required this.show});

  @override
  _SeatSelectionScreenState createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  Set<String> selectedSeats = {};

  void _onSeatSelected(String seat) {
    setState(() {
      if (selectedSeats.contains(seat)) {
        selectedSeats.remove(seat);
      } else {
        selectedSeats.add(seat);
      }
    });
  }

  void _bookSeats() {
    // Implement your booking logic here
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Booking seats: ${selectedSeats.join(', ')}')),
    );
    // You might want to navigate to a booking confirmation screen or perform an API call here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Select Seat for ${widget.show.type} ticket'.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: AnimatedBackgroundWidget(
        child: Container(
          // Use Container with BoxDecoration for gradient background
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.teal.withOpacity(0.1), // Very light shade of teal
                Colors.blue.withOpacity(0.2), // Slightly darker shade
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: TheaterSeatingLayout(
                  onSeatSelected: _onSeatSelected,
                ),
              ),
              if (selectedSeats.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: _bookSeats,
                    child: Text(
                      'Book ${selectedSeats.length} Seat(s)',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
