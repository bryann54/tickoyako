import 'package:flutter/material.dart';

class SeatMapWidget extends StatelessWidget {
  final List<String> availableSeats;
  final Function(String) onSeatSelected;

  const SeatMapWidget({
    required this.availableSeats,
    required this.onSeatSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5, // Adjust the number of columns
      ),
      itemCount: availableSeats.length,
      itemBuilder: (context, index) {
        final seat = availableSeats[index];
        return GestureDetector(
          onTap: () => onSeatSelected(seat),
          child: Card(
            color: Colors.blueAccent,
            child: Center(
              child: Text(seat),
            ),
          ),
        );
      },
    );
  }
}
