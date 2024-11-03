// custom_list_tile.dart
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const CustomListTile(this.icon, this.title, this.subtitle, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
     title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle,
       style: TextStyle(fontWeight: FontWeight.w500),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.teal),
    );
  }
}
