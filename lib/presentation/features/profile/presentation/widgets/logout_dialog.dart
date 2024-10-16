import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';

class CustomLogoutDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomLogoutDialog({
    Key? key,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog.adaptive(
      backgroundColor: AppColors.secondaryColor, // Custom color for the dialog
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Rounded corners
      ),
      title: const Text(
        confirm_logout,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      content: const Text(
        logout_text,
        style: TextStyle(fontSize: 16),
      ),
      actions: <Widget>[
        GestureDetector(
          onTap: onCancel, // Cancel action
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                cancel,
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onConfirm, // Confirm (logout) action
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                logout,
                style: TextStyle(
                  color: AppColors.textPrimary, // Custom text color
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
