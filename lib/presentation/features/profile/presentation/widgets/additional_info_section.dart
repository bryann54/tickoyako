// additional_info_section.dart
import 'package:flutter/material.dart';
import 'custom_list_tile.dart';

class AdditionalInfoSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade400),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Card(
          elevation: 0,
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              CustomListTile(Icons.favorite, 'Favorite Events', '5 events'),
              Divider(),
              CustomListTile(Icons.history, 'Event History', '12 attended'),
              Divider(),
              CustomListTile(Icons.star, 'Loyalty Points', '250 points'),
            ],
          ),
        ),
      ),
    );
  }
}
