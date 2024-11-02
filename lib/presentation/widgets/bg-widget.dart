import 'package:flutter/material.dart';
import 'package:tickoyako/presentation/widgets/animated_bg_widget.dart';

class AnimatedBackgroundWidget extends StatefulWidget {
  final Widget child;

  const AnimatedBackgroundWidget({Key? key, required this.child})
      : super(key: key);

  @override
  _AnimatedBackgroundWidgetState createState() =>
      _AnimatedBackgroundWidgetState();
}

class _AnimatedBackgroundWidgetState extends State<AnimatedBackgroundWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 5),
      vsync: this,
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedBackground(controller: _controller),
        widget.child,
      ],
    );
  }
}
