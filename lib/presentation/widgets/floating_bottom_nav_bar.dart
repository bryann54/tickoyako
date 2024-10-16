import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tickoyako/core/strings.dart';
import 'package:floating_frosted_bottom_bar/floating_frosted_bottom_bar.dart';

class FloatingBottomNavBar extends StatefulWidget {
  final List<Widget> children;

  const FloatingBottomNavBar({Key? key, required this.children})
      : super(key: key);

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
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        setState(() {
          _currentPage = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FrostedBottomBar(
      opacity: 0.8,
      sigmaX: 5,
      sigmaY: 5,
      borderRadius: BorderRadius.circular(500),
      duration: const Duration(milliseconds: 800),
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
            colors: [Colors.teal.shade200, Colors.teal.shade400],
          ),
        ),
        child: TabBar(
          indicatorPadding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          controller: _tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.teal.shade700, width: 4),
            insets: EdgeInsets.fromLTRB(16, 0, 16, 8),
          ),
          tabs: [
            _buildTab(Icons.home, home, 0),
            _buildTab(Icons.bookmark_border, bookmark, 1),
            _buildTab(Icons.person, profile, 2),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(IconData icon, String label, int index) {
    return Tab(
      icon: Icon(
        icon,
        color: _currentPage == index ? Colors.teal.shade900 : Colors.white,
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 12,
          color: _currentPage == index ? Colors.teal.shade900 : Colors.white,
        ),
      ),
    );
  }
}
