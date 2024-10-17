import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';

class CustomSwitchTile extends StatelessWidget {
  final BuildContext context;
  final IconData icon;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchTile({
    super.key,
    required this.context,
    required this.icon,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: Colors.teal,
        inactiveThumbColor: AppColors.textSecondary,

      ),
    );
  }
}
