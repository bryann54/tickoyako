// payment_details_section.dart
import 'package:flutter/material.dart';
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
          color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              CustomListTile(
                  Icons.credit_card, 'Default Card', '**** **** **** 1234'),
              Divider(),
              CustomListTile(
                  Icons.account_balance, 'Bank Account', '**** 5678'),
            ],
          ),
        ),
      ),
    );
  }
}
