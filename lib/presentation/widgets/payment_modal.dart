import 'package:flutter/material.dart';
import 'package:tickoyako/core/strings.dart';

class PaymentModal extends StatefulWidget {
  const PaymentModal({super.key});

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ticketsController = TextEditingController();

  bool _isFormValid = false;

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _ticketsController.dispose();
    super.dispose();
  }

  void _updateFormValidity() {
    setState(() {
      _isFormValid = _emailController.text.isNotEmpty &&
          _nameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _ticketsController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                payment_details,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: email,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                onChanged: (_) => _updateFormValidity(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: name,
                  border: OutlineInputBorder(),
                ),
                onChanged: (_) => _updateFormValidity(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: phone_number,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (_) => _updateFormValidity(),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ticketsController,
                decoration: const InputDecoration(
                  labelText: number_tickets,
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (_) => _updateFormValidity(),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _isFormValid
                    ? () {
                        // Handle purchase logic here
                        if (_formKey.currentState!.validate()) {
                          // Process the purchase
                          print('Purchase button pressed');
                          // You can add your purchase logic here
                          Navigator.of(context).pop(); // Close the modal
                        }
                      }
                    : null,
                child: const Text(purchase),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
