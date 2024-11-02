import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tickoyako/presentation/features/auth/presentation/bloc/auth_event.dart';

class SignUpTab extends StatefulWidget {
  const SignUpTab({Key? key}) : super(key: key);

  @override
  State<SignUpTab> createState() => _SignUpTabState();
}

class _SignUpTabState extends State<SignUpTab> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
    bool isChecked = false;

  @override
  void dispose() {
    _nameController.dispose();
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
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: fullname,
                 labelStyle:  const TextStyle(color: AppColors.primaryColor),
                prefixIcon: const Icon(Icons.person_outline,color: AppColors.primaryColor,),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return name_text;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: email,
                 labelStyle:  const TextStyle(color: AppColors.primaryColor),
                prefixIcon: const Icon(Icons.email_outlined,
                  color: AppColors.primaryColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return email_hint;
                }
                return null;
              },
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _passwordController,
              obscureText: _obscurePassword,
              decoration: InputDecoration(
                labelText: password,
                labelStyle:  const TextStyle(color: AppColors.primaryColor),
                prefixIcon: const Icon(Icons.lock_outline,
                  color: AppColors.primaryColor,
                ),
                suffixIcon: IconButton(
                  icon: Icon(_obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined),
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
                if (value?.isEmpty ?? true) {
                  return password_hint;
                }
                return null;
              },
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: BlocBuilder<AuthBloc, AuthState>(
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is AuthLoading
                        ? null
                        : () {
                            if (_formKey.currentState?.validate() ?? false) {
                              context.read<AuthBloc>().add(
                                    SignUpSubmitted(
                                      name: _nameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text,
                                    ),
                                  );
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: state is AuthLoading
                        ? const SizedBox(
                            height: 24,
                            width: 24,
                            child: CircularProgressIndicator.adaptive(),
                          )
                        : const Text(signup),
                  );
                },
              ),
            ),
                 const SizedBox(height: 24),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey.shade200, Colors.grey.shade400],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(
                      or_text,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade600,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 1,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.grey.shade400, Colors.grey.shade200],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 14),
            // Social Login Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialButton(
                  imagePath: 'assets/google.png',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  imagePath: 'assets/fb1.png',
                  onPressed: () {
                    // Handle button press
                  },
                ),
                const SizedBox(width: 16),
                _buildSocialButton(
                  imagePath: 'assets/apple.png',
                  onPressed: () {
                    // Handle button press
                  },
                ),
              ],
            ),
                 const SizedBox(height: 94),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: 15,
                        width: 15,
                        decoration: BoxDecoration(
                          color: isChecked ? Colors.teal : Colors.transparent,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isChecked ? Colors.teal : Colors.grey,
                            width: 1,
                          ),
                        ),
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                isChecked = !isChecked;
                              });
                            },
                            child: Center(
                              child: isChecked
                                  ? const Icon(
                                      Icons.check,
                                      size: 12,
                                      color: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'I Accept All The ',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigate to terms and conditions page
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Terms and Conditions',
                            style: TextStyle(
                                color: AppColors.primaryColor, fontSize: 12)),
                        const Padding(
                          padding: EdgeInsets.all(4.0),
                          child: Text(
                            '&',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to privacy policy page
                          },
                          child: const Text('Privacy Policy',
                              style: TextStyle(
                                  color: AppColors.primaryColor, fontSize: 12)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
       
           
          ],
        ),
      ),
    );
  }

 Widget _buildSocialButton({
    required String imagePath, // Change to String for image asset path
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
          child: Image.asset(
            imagePath,
            height: 50,
            width: 50,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

}
