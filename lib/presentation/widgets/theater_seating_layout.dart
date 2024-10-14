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
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: isSelected ? Colors.blue : Colors.grey[300],
                border: Border.all(color: Colors.black),
              ),
              child: Center(
                child: Text(
                  '${startSeat + index}',
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black,
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
                decoration: const BoxDecoration(color: Colors.grey),
                child: const Center(
                  child: Text('STAGE',
                      style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              buildRow('1-A', 1, 21),
              buildRow('2-B', 1, 22),
              buildRow('3-C', 1, 23),
              buildRow('4-D', 1, 24),
              buildRow('5-E', 1, 25),
              buildRow('6-F', 1, 26),
              buildRow('7-G', 1, 28),
              buildRow('8-H', 1, 30),
              buildRow('9-I', 1, 31),
              buildRow('10-J', 1, 28),
              buildRow('11-K', 1, 31),
              const SizedBox(height: 20),
              buildRow('12-L', 1, 14),
              buildRow('13-M', 1, 10),
              buildRow('14-N', 1, 8),
              const SizedBox(height: 40),
              Container(
                height: 40,
                width: 500, // Adjust this width as needed
                decoration: const BoxDecoration(color: Colors.grey),
                child: const Center(
                  child: Text('BALCONY',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),
              buildRow('15-O', 1, 24),
              buildRow('16-P', 1, 20),
              buildRow('17-Q', 1, 8),
              buildRow('18-R', 1, 2),
            ],
          ),
        ),
      ),
    );
  }
}
