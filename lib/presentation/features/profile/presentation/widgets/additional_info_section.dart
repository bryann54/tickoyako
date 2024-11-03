// additional_info_section.dart
import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';
import 'custom_list_tile.dart';

class AdditionalInfoSection extends StatelessWidget {
  const AdditionalInfoSection({Key? key}) : super(key: key);
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
         color: Colors.transparent.withOpacity(.1),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: const Column(
            children: [
              CustomListTile(Icons.favorite, 'Favorite Events', '5 events'),
              Divider(
                color: AppColors.textSecondary,
              ),
              CustomListTile(Icons.history, 'Event History', '12 attended'),
              Divider(
                color: AppColors.textSecondary,
              ),
              CustomListTile(Icons.star, 'Loyalty Points', '250 points'),
            ],
          ),
        ),
      ),
    );
  }
}
