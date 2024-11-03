import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/screens/shows_screen.dart'; 

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
  bool _isLoading = false;

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
                labelStyle: const TextStyle(color: AppColors.primaryColor),
                hintText: email_hint,
                hintStyle: const TextStyle(fontSize: 14, color: Colors.grey),
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
                prefixIcon: const Icon(
                  Icons.lock_outline,
                  color: AppColors.primaryColor,
                ),
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
                child: const Text(forgot_password),
              ),
            ),
            const SizedBox(height: 7),
            // Login Button
            Material(
              elevation: 4,
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading
                      ? null
                      : () async {
                          if (_formKey.currentState!.validate()) {
                            setState(() => _isLoading = true);

                            try {
                              // Add your login logic here
                              await Future.delayed(const Duration(
                                  seconds: 1)); // Simulate API call

                              if (!mounted) return;

                              // Navigate to home screen
                              Navigator.pushReplacement(
                                context,
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const ShowListScreen(), // Your destination screen
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeTransition(
                                      opacity: animation,
                                      child: SlideTransition(
                                        position: Tween<Offset>(
                                          begin: const Offset(0.1, 0.0),
                                          end: Offset.zero,
                                        ).animate(
                                          CurvedAnimation(
                                            parent: animation,
                                            curve: Curves.easeOutCubic,
                                          ),
                                        ),
                                        child: child,
                                      ),
                                    );
                                  },
                                  transitionDuration:
                                      const Duration(milliseconds: 500),
                                ),
                              );
                            } catch (e) {
                              if (!mounted) return;

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content:
                                      Text('Login failed: ${e.toString()}'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            } finally {
                              if (mounted) {
                                setState(() => _isLoading = false);
                              }
                            }
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: AppColors.primaryColor,
                    disabledBackgroundColor:
                        AppColors.primaryColor.withOpacity(0.6),
                  ),
                  child: _isLoading
                      ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        )
                      : const Text(
                          login,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
