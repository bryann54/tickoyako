

import 'package:flutter/material.dart';
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
                hintText: email_txt,
                prefixIcon: const Icon(Icons.email_outlined),
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
                labelText: 'Password',
                hintText: 'Enter your password',
                prefixIcon: const Icon(Icons.lock_outline),
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
                  return 'Please enter your password';
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
                child: const Text('Forgot Password?'),
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
                  'Login',
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
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(12),
      child: Material(
        elevation: 5,
         borderRadius: BorderRadius.circular(12),
        child: Container(
          
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
 borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, size: 40),
        ),
      ),
    );
  }
}
