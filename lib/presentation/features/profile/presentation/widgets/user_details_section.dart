// user_details_section.dart
import 'package:flutter/material.dart';
import 'custom_list_tile.dart';

class UserDetailsSection extends StatelessWidget {
  const UserDetailsSection({super.key});

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
              CustomListTile(Icons.phone, 'Phone', '+2547 34 567 890'),
              Divider(),
              CustomListTile(
                  Icons.location_on, 'Address', '123 Main St, City, Country'),
              Divider(),
              CustomListTile(Icons.cake, 'Birthday', 'January 1, 1990'),
            ],
          ),
        ),
      ),
    );
  }
}
