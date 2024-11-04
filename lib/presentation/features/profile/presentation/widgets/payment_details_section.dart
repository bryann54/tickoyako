// payment_details_section.dart
import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';
import 'custom_list_tile.dart';

class PaymentDetailsSection extends StatelessWidget {
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
          color: Colors.grey.withOpacity(.1),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              CustomListTile(
                  Icons.credit_card, 'Default Card', '**** **** **** 1234'),
              Divider(
                color: AppColors.textSecondary,
              ),
              CustomListTile(
                  Icons.account_balance, 'Bank Account', '**** 5678'),
            ],
          ),
        ),
      ),
    );
  }
}
