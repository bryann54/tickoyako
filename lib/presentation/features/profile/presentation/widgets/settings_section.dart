// settings_section.dart
import 'package:flutter/material.dart';
import 'custom_list_tile.dart';
import 'custom_switch_tile.dart';

class SettingsSection extends StatelessWidget {
  const SettingsSection({super.key});

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
          margin: const EdgeInsets.symmetric(horizontal: 2),
          child: Column(
            children: [
              CustomSwitchTile(
                  context, Icons.notifications, 'Notifications', true),
              Divider(),
              CustomSwitchTile(
                  context, Icons.lock, 'Two-Factor Authentication', false),
              Divider(),
              CustomSwitchTile(context, Icons.lock, 'Dark mode', false),
              Divider(),
              CustomListTile(Icons.language, 'Language', 'English'),
            ],
          ),
        ),
      ),
    );
  }
}
