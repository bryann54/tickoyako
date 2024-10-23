import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tickoyako/presentation/features/auth/presentation/bloc/auth_event.dart';
import 'package:tickoyako/presentation/features/auth/presentation/widgets/social_buttons.dart';

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
                   const SizedBox(height: 34),
            const Text(
              login_options,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 14,
            ),
            // Social Login Options
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SocialButton(
                  icon: Icons.g_mobiledata,
                 onPressed: () {
                    context.read<AuthBloc>().add(GoogleSignInRequested());
                  },
                ),
                const SizedBox(width: 16),
                SocialButton(
                  icon: Icons.facebook,
                  color: Colors.blue,
                  onPressed: () {
                    // Handle Facebook login
                  },
                ),
                const SizedBox(width: 16),
                SocialButton(
                  icon: Icons.apple,
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 24),
          ],
      
        ),
      ),
    );
  }

}
