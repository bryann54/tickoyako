import 'package:flutter/material.dart';

class AnimatedBackground extends StatelessWidget {
  final AnimationController controller;

  const AnimatedBackground({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Stack(
          children: [
            // Large Primary Circle
            Positioned(
              top: -80 + (100 * controller.value),
              right: -70,
              child: _buildCircle(
                width: 300,
                height: 300,
                color: Colors.teal.shade900,
                scale: 1 + controller.value * 0.15,
                rotation: controller.value * 0.4,
              ),
            ),
            // Second Large Circle
            Positioned(
              bottom: 250 - (-60 * controller.value),
              left: 30,
              child: _buildCircle(
                width: 280,
                height: 280,
                color: Colors.teal.shade800,
                scale: 1 + controller.value * 0.08,
                rotation: -controller.value * 0.3,
              ),
            ),
            // Medium Floating Circle
            Positioned(
              bottom: 50 + (120 * controller.value),
              left: 280,
              child: _buildCircle(
                width: 150,
                height: 150,
                color: Colors.teal.shade700,
                scale: 1 + controller.value * 0.12,
                rotation: controller.value * 0.25,
              ),
            ),
            // Small Accent Circle
            Positioned(
              top: 150 + (-40 * controller.value),
              left: -50,
              child: _buildCircle(
                width: 100,
                height: 100,
                color: Colors.tealAccent.shade700,
                scale: 1 + controller.value * 0.1,
                rotation: controller.value * 0.2,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildCircle({
    required double width,
    required double height,
    required Color color,
    required double scale,
    required double rotation,
  }) {
    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withOpacity(0.3),
                color.withOpacity(0.1),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
