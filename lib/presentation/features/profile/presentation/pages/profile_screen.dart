// profile_screen.dart
import 'package:flutter/material.dart';
import 'package:tickoyako/presentation/features/profile/presentation/widgets/additional_info_section.dart';
import 'package:tickoyako/presentation/features/profile/presentation/widgets/logout_button.dart';
import 'package:tickoyako/presentation/features/profile/presentation/widgets/payment_details_section.dart';
import 'package:tickoyako/presentation/features/profile/presentation/widgets/profile_app_bar.dart';
import 'package:tickoyako/presentation/features/profile/presentation/widgets/settings_section.dart';
import 'package:tickoyako/presentation/features/profile/presentation/widgets/user_details_section.dart';
import 'package:tickoyako/presentation/widgets/bg-widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: AnimatedBackgroundWidget(
        child: CustomScrollView(
          slivers: [
            ProfileAppBar(),
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  _buildSectionTitle(context, 'User Details'),
                  UserDetailsSection(),
                  _buildSectionTitle(context, 'Payment Details'),
                  PaymentDetailsSection(),
                  _buildSectionTitle(context, 'Settings'),
                  SettingsSection(),
                  _buildSectionTitle(context, 'Additional Information'),
                  AdditionalInfoSection(),
                  const SizedBox(height: 20),
                  LogOutButton(),
                  const SizedBox(height: 120),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: Colors.teal.shade700,
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
