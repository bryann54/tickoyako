import 'package:flutter/material.dart';
import 'package:tickoyako/core/strings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
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
          ),
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                _buildSectionTitle(context, 'User Details'),
                _buildUserDetails(),
                _buildSectionTitle(context, 'Payment Details'),
                _buildPaymentDetails(),
                _buildSectionTitle(context, 'Settings'),
                _buildSettings(context),
                _buildSectionTitle(context, 'Additional Information'),
                _buildAdditionalInfo(),
                const SizedBox(height: 20), // Bottom padding
              ],
            ),
          ),
        ],
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

  Widget _buildUserDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
   decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400),
         borderRadius: BorderRadius.circular(15)),
        child: Card(elevation: 0,
        color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              _buildListTile(Icons.phone, 'Phone', '+1 234 567 890'),
                Divider(),
              _buildListTile(
                  Icons.location_on, 'Address', '123 Main St, City, Country'),
                    Divider(),
              _buildListTile(Icons.cake, 'Birthday', 'January 1, 1990'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPaymentDetails() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
   decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400),
         borderRadius: BorderRadius.circular(15)),
        child: Card(elevation: 0,
        color: Colors.white,
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              _buildListTile(
                  Icons.credit_card, 'Default Card', '**** **** **** 1234'),
                    Divider(),
              _buildListTile(Icons.account_balance, 'Bank Account', '**** 5678'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettings(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
         decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400),
         borderRadius: BorderRadius.circular(15)),
        child: Card(
          elevation: 0,
        color: Colors.white,
          
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              _buildSwitchTile(context, Icons.notifications, 'Notifications', true),
                Divider(),
              _buildSwitchTile(
                  context, Icons.lock, 'Two-Factor Authentication', false),
                    Divider(),
                  _buildSwitchTile(
                  context, Icons.lock, ' Dark mode', false),
                    Divider(),
              _buildListTile(Icons.language, 'Language', 'English'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAdditionalInfo() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
  decoration: BoxDecoration(border: Border.all(color: Colors.grey.shade400),
         borderRadius: BorderRadius.circular(15)),
        child: Card(elevation: 0,
        color: Colors.white,
           
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              _buildListTile(Icons.favorite, 'Favorite Events', '5 events'),
              Divider(),
              _buildListTile(Icons.history, 'Event History', '12 attended'),
                 Divider(),
              _buildListTile(Icons.star, 'Loyalty Points', '250 points'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String subtitle) {
    return ListTile(
      leading: Icon(icon, color: Colors.teal),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.chevron_right, color: Colors.teal),
    );
  }

  Widget _buildSwitchTile(
      BuildContext context, IconData icon, String title, bool value) {
    return SwitchListTile(
      secondary: Icon(icon, color: Colors.teal),
      title: Text(title),
      value: value,
      activeColor: Colors.teal,
      onChanged: (bool newValue) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('$title ${newValue ? 'enabled' : 'disabled'}')),
        );
      },
    );
  }
}
