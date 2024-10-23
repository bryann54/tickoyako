import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/presentation/screens/shows_screen.dart';

class GetstartedButton extends StatefulWidget {
  const GetstartedButton({super.key});

  @override
  State<GetstartedButton> createState() => _GetstartedButtonState();
}

class _GetstartedButtonState extends State<GetstartedButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            // Navigate to the next screen
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    const ShowListScreen(), // Replace with your actual screen
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  get_started.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
          ),
        ),
      ],
    );
  }

}

class AnimatedImage extends StatefulWidget {
  const AnimatedImage({super.key});

  @override
  State<AnimatedImage> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 1.0, end: 1.1).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _animation,
           child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Material(
              elevation: 5,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: Text(
                  get_started.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
          ),
      
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
