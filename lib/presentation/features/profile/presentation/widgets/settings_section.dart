import 'package:flutter/material.dart';
import 'custom_list_tile.dart';
import 'custom_switch_tile.dart';

class SettingsSection extends StatefulWidget {
  const SettingsSection({super.key});

  @override
  State<SettingsSection> createState() => _SettingsSectionState();
}

class _SettingsSectionState extends State<SettingsSection> {
  // State variables to track switch values
  bool notificationsEnabled = true;
  bool twoFactorEnabled = false;
  bool darkModeEnabled = false;

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
                context: context,
                icon: Icons.notifications,
                title: 'Notifications',
                value: notificationsEnabled,
                onChanged: (bool value) {
                  setState(() {
                    notificationsEnabled = value;
                  });
                },
              ),
              const Divider(),
              CustomSwitchTile(
                context: context,
                icon: Icons.lock,
                title: 'Two-Factor Authentication',
                value: twoFactorEnabled,
                onChanged: (bool value) {
                  setState(() {
                    twoFactorEnabled = value;
                  });
                },
              ),
              const Divider(),
              CustomSwitchTile(
                context: context,
                icon: Icons.lock,
                title: 'Dark mode',
                value: darkModeEnabled,
                onChanged: (bool value) {
                  setState(() {
                    darkModeEnabled = value;
                  });
                },
              ),
              const Divider(),
              CustomListTile(Icons.language, 'Language', 'English'),
            ],
          ),
        ),
      ),
    );
  }
}