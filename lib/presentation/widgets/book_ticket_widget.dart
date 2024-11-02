import 'package:flutter/material.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/data/models/show_model.dart';
import 'package:tickoyako/presentation/widgets/payment_modal.dart';

class BookTicketWidget extends StatelessWidget {
  const BookTicketWidget({super.key, required this.showModel});
  final ShowModel showModel;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade900, Colors.lightBlue.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: ElevatedButton.icon(
          icon: const Icon(Icons.confirmation_number),
          label: const Text(book_ticket),
          onPressed: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: dismiss,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (context, animation, secondaryAnimation) {
                return PaymentModal(showModel: showModel);
              },
              transitionBuilder:
                  (context, animation, secondaryAnimation, child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0, 1),
                    end: Offset.zero,
                  ).animate(animation),
                  child: child,
                );
              },
            );
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
