// auth_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/presentation/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:tickoyako/presentation/features/auth/presentation/widgets/login_tab_widget.dart';
import 'package:tickoyako/presentation/features/auth/presentation/widgets/signup_tab_widget.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(),
      child: const AuthView(),
    );
  }
}

class AuthView extends StatelessWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            } else if (state is AuthSuccess) {
              // Navigate to home screen or show success message
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 40),
                // Logo
                Container(
                  height: 70,
                  width: 70,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    Icons.lock_outlined,
                    size: 40,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(height: 24),
                // Welcome Text
                Text(
                  'Welcome Back',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 32),
                // Tab Bar
         Container(
  margin: const EdgeInsets.symmetric(horizontal: 24),
  height: 60, // Increased height for better visibility
  decoration: BoxDecoration(
    color: Colors.grey[200],
    borderRadius: BorderRadius.circular(15),
  ),
  child: TabBar(
    padding: const EdgeInsets.all(8), // Increased padding
    indicator: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(12), // Increased border radius
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).primaryColor.withOpacity(0.3),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ],
    ),
    labelColor: Colors.white,
    unselectedLabelColor: Colors.grey[800],
    labelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    tabs: [
      Tab(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text('Login'),
        ),
      ),
      Tab(
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          child: const Text('Sign Up'),
        ),
      ),
    ],
  ),
),
                const Expanded(
                  child: TabBarView(
                    children: [
                      LoginTab(),
                      SignUpTab(),
                    ],
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
