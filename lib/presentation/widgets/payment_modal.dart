import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'dart:ui';

import 'package:tickoyako/data/models/show_model.dart';

class PaymentModal extends StatefulWidget {
  const PaymentModal({super.key, required this.showModel});
  final ShowModel showModel;

  @override
  State<PaymentModal> createState() => _PaymentModalState();
}

class _PaymentModalState extends State<PaymentModal> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _ticketsController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _nameController.dispose();
    _phoneController.dispose();
    _ticketsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final show = widget.showModel;
    return Dialog(
   
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: AppColors.backgroundDark
          ),
          color: Colors.white.withOpacity(0.95),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Stack(
            children: [
              // Background Image with Blur Effect
              Positioned.fill(
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: CachedNetworkImage(
                    imageUrl: 
                  show.imgUrl,
                    fit: BoxFit.cover,
                    color: Colors.white.withOpacity(0.4),
                    colorBlendMode: BlendMode.darken,
                  ),
                ),
              ),
              // Gradient Overlay
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                 Colors.white.withOpacity(0.3),
                        Colors.white.withOpacity(0.6),
                      ],
                    ),
                  ),
                ),
              ),
              // Content
              SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Header
                      _buildHeader(context),
                      const SizedBox(height: 24),
                      // Form Fields
                      _buildFormFields(),
                      const SizedBox(height: 24),
                      // Submit Button
                      _buildSubmitButton(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Column(
     children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.15),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: Colors.white.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: const Icon(
            Icons.payment_rounded,
            size: 32,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 16),
       ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
             colors: [Colors.teal.shade800, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ).createShader(bounds),
          child: Text(
            payment_details,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
             shadows: [
                Shadow(
                  color: Colors.black.withOpacity(0.5),
                  blurRadius: 4,
                  offset: Offset(2, 2),
                ),
              ],

            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        _buildTextField(
          controller: _emailController,
          labelText: email,
          prefixIcon: Icons.email_outlined,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return wrong_email;
            }
            if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
              return wrong_email;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _nameController,
          labelText: name,
          prefixIcon: Icons.person_outline,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return ticket_name;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _phoneController,
          labelText: phone_number,
          prefixIcon: Icons.phone_outlined,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return number_billing;
            }
            if (value.length != 10) {
              return valid_number;
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        _buildTextField(
          controller: _ticketsController,
          labelText: number_tickets,
          prefixIcon: Icons.confirmation_number_outlined,
          keyboardType: TextInputType.number,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return ticket_number;
            }
            if (int.tryParse(value) == null || int.parse(value) <= 0) {
              return ticket_number;
            }
            return null;
          },
        ),
      ],
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String labelText,
    required IconData prefixIcon,
    String? Function(String?)? validator,
    TextInputType? keyboardType,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color:  Colors.white.withOpacity(0.7),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5,
            spreadRadius: 1,
          ),  
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.grey[700]),
          prefixIcon: Icon(prefixIcon, color: Colors.teal),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.grey.shade300),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.teal, width: 2),
          ),
          filled: true,
          fillColor: Colors.white.withOpacity(0.7),
        ),
        style: const TextStyle(color: Colors.black87),
        keyboardType: keyboardType,
        validator: validator,
      ),
    );
  }   

  Widget _buildSubmitButton() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: AppColors.darkButtonGradient,
        boxShadow: [
          BoxShadow(
            color: Colors.teal.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ElevatedButton.icon(
       
        label: const Text(
          purchase,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: AppColors.background,
            letterSpacing: 0.5,
          ),
        ),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            print('Form submitted successfully!');
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

}
