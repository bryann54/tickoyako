

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tickoyako/core/colors.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:tickoyako/data/models/show_model.dart';

class AnimatedInfoCard extends StatefulWidget {
  final ShowModel show;
  final bool isLightMode;

  const AnimatedInfoCard({
    Key? key,
    required this.show,
    required this.isLightMode,
  }) : super(key: key);

  @override
  State<AnimatedInfoCard> createState() => _AnimatedInfoCardState();
}

class _AnimatedInfoCardState extends State<AnimatedInfoCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<Offset>> _slideAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    // Create staggered animations for each info row
    _slideAnimations = List.generate(
      5, // Number of info rows
      (index) => Tween<Offset>(
        begin: const Offset(0, -0.5),
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(
            index * 0.1, // Stagger start times
            0.6 + (index * 0.1), // Stagger end times
            curve: Curves.easeOutBack,
          ),
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Animation<Offset> animation,
  ) {
    return SlideTransition(
      position: animation,
      child: FadeTransition(
        opacity: animation.drive(CurveTween(curve: Curves.easeIn)),
        child: _buildInfoRow(context, icon, label, value),
      ),
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color: widget.isLightMode
                ? AppColors.primaryColor
                : AppColors.primaryColorDark,
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color:
                      widget.isLightMode ? Colors.grey[600] : Colors.grey[400],
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: widget.isLightMode ? Colors.black87 : Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final show = widget.show;

    return Card(
      elevation: 2,
      color:
          widget.isLightMode ? AppColors.surface : AppColors.surfaceColorDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: widget.isLightMode
              ? AppColors.primaryColor
              : AppColors.primaryColorDark,
        ),
      ),
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0.95, end: 1.0),
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        builder: (context, scale, child) {
          return Transform.scale(
            scale: scale,
            child: child,
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAnimatedInfoRow(
                context,
                Icons.calendar_today,
                'Date',
                DateFormat('MMM dd, yyyy').format(show.date),
                _slideAnimations[0],
              ),
              _buildAnimatedInfoRow(
                context,
                Icons.location_on,
                'venue',
                show.venue,
                _slideAnimations[1],
              ),
              _buildAnimatedInfoRow(
                context,
                Icons.phone,
                'Contact',
                show.contact,
                _slideAnimations[2],
              ),
              _buildAnimatedInfoRow(
                context,
                Icons.attach_money,
                'Price',
                'Ksh ${NumberFormat('#,###').format(show.price)}',
                _slideAnimations[3],
              ),
              _buildAnimatedInfoRow(
                context,
                Icons.person,
                event_owner,
                show.event_owner,
                _slideAnimations[4],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
