import 'package:flutter/material.dart';

class TheaterSeatingLayout extends StatefulWidget {
  final Function(String) onSeatSelected;

  const TheaterSeatingLayout({super.key, required this.onSeatSelected});

  @override
  State<TheaterSeatingLayout> createState() => _TheaterSeatingLayoutState();
}

class _TheaterSeatingLayoutState extends State<TheaterSeatingLayout> {
  Set<String> selectedSeats = {};

  Widget buildRow(String rowName, int startSeat, int endSeat) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(rowName, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(width: 8),
        ...List.generate(endSeat - startSeat + 1, (index) {
          final seatNumber = '$rowName-${startSeat + index}';
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
            child: Container(
              margin: const EdgeInsets.all(2),
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: isSelected ? Colors.blue : Colors.black38,
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: Text(
                  '${startSeat + index}',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.white,
                    fontSize: 10,
                  ),
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 40,
                width: 500, // Adjust this width as needed
                decoration: const BoxDecoration(color: Colors.black87),
                child: const Center(
                  child: Text('STAGE',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              buildRow('A', 1, 21),
              buildRow('B', 1, 22),
              buildRow('C', 1, 23),
              buildRow('D', 1, 24),
              buildRow('E', 1, 25),
              buildRow('F', 1, 26),
              buildRow('G', 1, 28),
              buildRow('H', 1, 30),
              buildRow('I', 1, 31),
              buildRow('1J', 1, 28),
              buildRow('1K', 1, 31),
              const SizedBox(height: 20),
              buildRow('L', 1, 14),
              buildRow('M', 1, 10),
              buildRow('N', 1, 8),
              const SizedBox(height: 40),
              Container(
                height: 40,
                width: 500, // Adjust this width as needed
                decoration: const BoxDecoration(color: Colors.black87),
                child: const Center(
                  child: Text('BALCONY',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              buildRow('O', 1, 24),
              buildRow('P', 1, 20),
              buildRow('Q', 1, 8),
              buildRow('R', 1, 2),
            ],
          ),
        ),
      ),
    );
  }
}
