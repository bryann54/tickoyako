import 'package:flutter/material.dart';

class SeatMapWidget extends StatefulWidget {
  final int totalSeats;
  final Function(String) onSeatSelected;

  const SeatMapWidget({
    super.key,
    required this.totalSeats,
    required this.onSeatSelected,
  });

  @override
  _SeatMapWidgetState createState() => _SeatMapWidgetState();
}

class _SeatMapWidgetState extends State<SeatMapWidget> {
  Set<String> selectedSeats = {};

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 10,
        childAspectRatio: 1,
        crossAxisSpacing: 3,
        mainAxisSpacing: 2,
      ),
      itemCount: widget.totalSeats,
      itemBuilder: (context, index) {
        final seatNumber = (index + 1).toString().padLeft(3, '0');
        final isSelected = selectedSeats.contains(seatNumber);

        return GestureDetector(
          onTap: () {
            setState(() {
              if (isSelected) {
                selectedSeats.remove(seatNumber);
              } else {
                selectedSeats.add(seatNumber);
              }
            });
            widget.onSeatSelected(seatNumber);
          },
          child: Card(
            color: isSelected ? Colors.blue : Colors.grey[300],
            child: Center(
              child: Text(
                seatNumber,
                style: TextStyle(
                  color: isSelected ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
