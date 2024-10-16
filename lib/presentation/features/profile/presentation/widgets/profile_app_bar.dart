// profile_app_bar.dart
import 'package:flutter/material.dart';
import 'package:tickoyako/core/strings.dart';

class ProfileAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      backgroundColor: Colors.teal,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          double percentage = (constraints.maxHeight - kToolbarHeight) /
              (200.0 - kToolbarHeight);
          double avatarSize = percentage.clamp(0.5, 1.0) * 80;

          return FlexibleSpaceBar(
            title: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Opacity(
                        opacity: percentage.clamp(0.0, 1.0),
                        child: CircleAvatar(
                          radius: avatarSize / 2.5,
                          backgroundColor: Colors.teal.shade200,
                          child: Icon(Icons.person,
                              size: avatarSize / 2, color: Colors.white),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Opacity(
                          opacity: percentage.clamp(0.0, 1.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'John Doe',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                'johndoe@example.com',
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            background: Stack(
              fit: StackFit.expand,
              children: [
                Container(color: Colors.teal),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(30)),
                    ),
                  ),
                ),
              ],
            ),
            collapseMode: CollapseMode.pin,
          );
        },
      ),
    );
  }
}
