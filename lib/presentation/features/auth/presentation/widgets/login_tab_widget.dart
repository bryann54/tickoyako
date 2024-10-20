import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';

class LoginTab extends StatefulWidget {
  const LoginTab({Key? key}) : super(key: key);

  @override
  State<LoginTab> createState() => _LoginTabState();
}

class _LoginTabState extends State<LoginTab> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Email Field
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: email,
                labelStyle:const TextStyle(color: AppColors.primaryColor),
                hintText: email_hint,
                
                hintStyle: 
                const TextStyle(fontSize: 14, color: Colors.grey),
                prefixIcon: const Icon(Icons.email_outlined,
                    color: AppColors.primaryColor),
               
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return email_txt;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Password Field
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                hintText: password_hint,
                 labelStyle: const TextStyle(color: AppColors.primaryColor),
                 hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
                prefixIcon: const Icon(Icons.lock_outline,color: AppColors.primaryColor,),
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscurePassword 
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined,
                  ),
                  onPressed: () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return ;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            // Forgot Password Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Handle forgot password
                },
                child: const Text(forgot_password),
              ),
            ),
            const SizedBox(height: 24),
            // Login Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Handle login
                  }
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  login,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Social Login Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  icon: Icons.g_mobiledata,
                  onPressed: () {
                    // Handle Google login
                  },
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  icon: Icons.facebook,
                  color: Colors.blue,
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  icon: Icons.apple,
                  onPressed: () {
                    // Handle Apple login
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    Color? color, // Optional icon color
    required VoidCallback onPressed,
  }) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          // Apply the optional color here
          child: Icon(
            icon,
            size: 50,
            color: color ??
                Colors.black, // Default to black if no color is provided
          ),
        ),
      ),
    );
  }
}
