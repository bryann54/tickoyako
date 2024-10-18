import 'package:flutter/material.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/features/auth/presentation/widgets/getstarted_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _scaleAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isAnimationComplete = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: const Interval(1.0, 1.5, curve: Curves.easeInOut),
    ));

    // Start the splash animation
    _controller.forward();

    // Trigger the button animation after the main splash animation is done
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isAnimationComplete = true;
        });
        // Delay before showing the GetStartedButton
        Future.delayed(const Duration(milliseconds: 500), () {
          _controller.forward(); // Restart the controller for button animation
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal.shade700, Colors.teal.shade300],
          ),
        ),
        child: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return FadeTransition(
                opacity: _fadeAnimation,
                child: ScaleTransition(
                  scale: _scaleAnimation,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(flex: 2),
                      const Icon(
                        Icons.event_seat,
                        size: 100,
                        color: Colors.white,
                      ),
                      const SizedBox(height: 20),
                      ShaderMask(
                        shaderCallback: (bounds) => const LinearGradient(
                          colors: [Colors.white, Colors.tealAccent],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds),
                        child: const Text(
                          tittle,
                          style: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const Spacer(flex: 1),
                      // Add smooth SlideTransition for the GetstartedButton
                      if (_isAnimationComplete)
                        SlideTransition(
                          position: _slideAnimation,
                          child: FadeTransition(
                            opacity:
                                Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: const Interval(0.0, 1.0,
                                    curve: Curves.easeIn),
                              ),
                            ),
                            child: const GetstartedButton(),
                          ),
                        ),
                      const SizedBox(height: 120),
                          const  Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [Text('terms & conditions apply')],
                                                    ),
                            )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
