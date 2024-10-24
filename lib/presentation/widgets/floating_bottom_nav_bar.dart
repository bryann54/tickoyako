import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';

class FloatingBottomNavBar extends StatefulWidget {
  final List<Widget> children;
  final double? width;

  const FloatingBottomNavBar({
    Key? key,
    required this.children,
    this.width,
  }) : super(key: key);

  @override
  State<FloatingBottomNavBar> createState() => _FloatingBottomNavBarState();
}

class _FloatingBottomNavBarState extends State<FloatingBottomNavBar>
    with SingleTickerProviderStateMixin {
  late int _currentPage;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _currentPage = 0;
    _tabController = TabController(length: widget.children.length, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    if (_tabController.indexIsChanging) {
      setState(() {
        _currentPage = _tabController.index;
      });
    }
  }

  @override
  void dispose() {
    _tabController.removeListener(_handleTabSelection);
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = widget.width ?? constraints.maxWidth;

        return SizedBox(
          width: width,
          child: FrostedBottomBar(
            width: width,
            opacity: 0.9,
            sigmaX: 5,
            sigmaY: 5,
            borderRadius: BorderRadius.circular(50),
            duration: const Duration(milliseconds: 200),
            hideOnScroll: true,
            body: (context, controller) => TabBarView(
              controller: _tabController,
              dragStartBehavior: DragStartBehavior.down,
              physics: const BouncingScrollPhysics(),
              children: widget.children,
            ),
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.teal.shade200,
                    Colors.teal.shade400,
                  ],
                ),
              ),
              child: TabBar(
                indicatorPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                controller: _tabController,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: Colors.teal.shade700,
                    width: 4,
                  ),
                  insets: const EdgeInsets.fromLTRB(10, 0, 10, 8),
                ),
                tabs: [
                  _buildTab(Icons.home, 'Home', 0),
                  _buildTab(Icons.bookmark_border, 'Bookmark', 1),
                  _buildTab(Icons.notifications, 'Notifications', 2),
                  _buildTab(Icons.person, 'Profile', 3),
                  
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTab(IconData icon, String label, int index) {
    final isSelected = _currentPage == index;
    return Tab(
      height: 60,
      icon: Icon(
        icon,
        color: isSelected ? Colors.teal.shade900 : Colors.white,
        size: 24,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          color: isSelected ? Colors.teal.shade900 : Colors.white,
        ),
      ),
    );
  }
}
