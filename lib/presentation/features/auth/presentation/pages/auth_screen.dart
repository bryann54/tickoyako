import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
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

class AuthView extends StatefulWidget {
  const AuthView({Key? key}) : super(key: key);

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _welcomeText = welcome_text;
  String _descriptionText = welcome;
  IconData _currentIcon = Icons.sign_language;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabChange);
  }

  void _handleTabChange() {
    if (_tabController.indexIsChanging) {
      setState(() {
        if (_tabController.index == 0) {
          _welcomeText = welcome_text;
          _descriptionText = welcome;
          _currentIcon = Icons.sign_language;
        } else {
          _welcomeText = get_started_txt;
          _descriptionText = get_stated;
          _currentIcon = Icons.person_add_outlined;
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              const SizedBox(height: 20),
              // Animated Logo
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(
                    turns:
                        Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                    child: ScaleTransition(
                      scale: animation,
                      child: FadeTransition(
                        opacity: animation,
                        child: child,
                      ),
                    ),
                  );
                },
                child: Container(
                  key: ValueKey<IconData>(_currentIcon),
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    gradient: AppColors.darkButtonGradient,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Icon(
                    _currentIcon,
                    size: 40,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Welcome Text with Animation
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return FadeTransition(
                    opacity: animation,
                    child: SlideTransition(
                      position: Tween<Offset>(
                        begin: const Offset(0.0, 0.2),
                        end: Offset.zero,
                      ).animate(animation),
                      child: child,
                    ),
                  );
                },
                child: Column(
                  key: ValueKey<String>(_welcomeText),
                  children: [
                    Text(
                      _welcomeText,
                      style:
                          Theme.of(context).textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    const SizedBox(height: 8),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: Text(
                        _descriptionText,
                        key: ValueKey<String>(_descriptionText),
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: Colors.grey[600],
                              height: 1.3,
                            ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              // Tab Bar
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 24),
                height: 60,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TabBar(
                  controller: _tabController,
                  automaticIndicatorColorAdjustment: true,
                  padding: const EdgeInsets.all(2),
                  indicator: BoxDecoration(
                    gradient: AppColors.darkButtonGradient,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  indicatorColor: Colors.transparent,
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
                        child: const Text(login),
                      ),
                    ),
                    Tab(
                      child: Container(
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: const Text(signup),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    LoginTab(),
                    SignUpTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
