import 'package:flutter/material.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/widgets/payment_modal.dart';

class BookTicketWidget extends StatelessWidget {
  const BookTicketWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(10),
        child: InkWell(
          onTap: () {
            showGeneralDialog(
              context: context,
              barrierDismissible: true,
              barrierLabel: dismiss,
              barrierColor: Colors.black.withOpacity(0.5),
              transitionDuration: const Duration(milliseconds: 700),
              pageBuilder: (context, animation, secondaryAnimation) {
                return const PaymentModal();
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
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              gradient: LinearGradient(
                colors: [Colors.blueGrey.shade900, Colors.lightBlue.shade900],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child:const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                Icon(
                  Icons.confirmation_number,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  book_ticket,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
