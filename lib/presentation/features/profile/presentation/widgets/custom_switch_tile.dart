// custom_switch_tile.dart
import 'package:flutter/material.dart';

class CustomSwitchTile extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final String title;
  final bool value;

  const CustomSwitchTile(this.context, this.icon, this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.teal),
      title: Text(title),
      value: value,
      activeColor: Colors.teal,
      onChanged: (bool newValue) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('$title ${newValue ? 'enabled' : 'disabled'}')),
        );
      },
    );
  }
}
