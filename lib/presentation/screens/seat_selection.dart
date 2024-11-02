import 'package:flutter/material.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'package:tickoyako/core/commons/custom_snackbar_widget.dart';
import 'package:tickoyako/presentation/widgets/theater_seating_layout.dart';

class SeatSelectionScreen extends StatefulWidget {
  final ShowModel show;

  const SeatSelectionScreen({Key? key, required this.show}) : super(key: key);

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
    CustomAnimatedSnackbar.show(
      context: context,
      message: 'Booked seats: ${selectedSeats.join(', ')}',
      icon: Icons.check_circle_outline,
      backgroundColor: const Color.fromARGB(190, 0, 0, 0),
    );
  }

  @override
  void dispose() {
    CustomAnimatedSnackbar.dismiss();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          'Select Seat for ${widget.show.type} ticket'.toUpperCase(),
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.teal.withOpacity(0.1),
              Colors.blue.withOpacity(0.2),
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
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                  ),
                  child: Text(
                    'Book ${selectedSeats.length} Seat(s)',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
