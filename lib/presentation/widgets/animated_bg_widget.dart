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
            // Large Main Circle
            Positioned(
              top: -50 + (70 * controller.value),
              right: -50,
              child: _buildCircle(
                width: 200,
                height: 200,
                color: Colors.teal.shade200,
                scale: 1 + controller.value * 0.1,
                rotation: controller.value * 0.3,
              ),
            ),
            // Second Large Circle
            Positioned(
              bottom: 200 - (-50 * controller.value),
              left: 50,
              child: _buildCircle(
                width: 250,
                height: 250,
                color: Colors.teal.shade400,
                scale: 1 + controller.value * 0.05,
                rotation: -controller.value * 0.2,
              ),
            ),
            // Small Moving Circle
            Positioned(
              bottom: 30 + (100 * controller.value),
              left: 250,
              child: _buildCircle(
                width: 80,
                height: 80,
                color: Colors.teal.shade600,
                scale: 1 + controller.value * 0.08,
                rotation: controller.value * 0.15,
              ),
            ),
            // Another Layered Circle
            Positioned(
              top: 100 + (-30 * controller.value),
              left: -70,
              child: _buildCircle(
                width: 120,
                height: 120,
                color: Colors.teal.shade300,
                scale: 1 + controller.value * 0.07,
                rotation: controller.value * 0.1,
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
                color.withOpacity(0.4),
                color.withOpacity(0.2),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.2),
                blurRadius: 20,
                spreadRadius: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
