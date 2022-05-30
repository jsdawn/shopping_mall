import 'package:flutter/material.dart';
import 'package:shopping_mall/app_theme.dart';

class NavigationWithView extends StatefulWidget {
  final List<NavIconData> items;
  final int position;

  const NavigationWithView(
      {Key? key, required this.items, required this.position})
      : super(key: key);

  @override
  State<NavigationWithView> createState() => _NavigationWithViewState();
}

class _NavigationWithViewState extends State<NavigationWithView> {
  late PageController _pageController;
  // tabbar position
  int _position = 0;

  @override
  void initState() {
    setState(() {
      _position = widget.position;
    });
    _pageController = PageController(initialPage: _position);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.nearlyWhite,
      body: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: PageView(
          controller: _pageController,
          children: widget.items.map((item) => item.body).toList(),
          onPageChanged: (position) => {setState(() => _position = position)},
        ),
      ),
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }

  /// _bottomNavigationBar
  Widget _bottomNavigationBar() => BottomNavigationBar(
      selectedFontSize: 11.0,
      unselectedFontSize: 11.0,
      iconSize: 26.0,
      selectedItemColor: AppTheme.primaryColor,
      backgroundColor: AppTheme.nearlyWhite,
      type: BottomNavigationBarType.fixed,
      items: widget.items
          .map((item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.label,
              activeIcon: Icon(item.activeIcon),
              backgroundColor: item.backgroundColor))
          .toList(),
      currentIndex: _position,
      onTap: (position) => {_pageController.jumpToPage(position)});
}

class NavIconData {
  const NavIconData({
    required this.icon,
    required this.label,
    IconData? activeIcon,
    this.backgroundColor,
    required this.body,
  }) : activeIcon = activeIcon ?? icon;

  final IconData icon;
  final IconData activeIcon;
  final String label;
  final Color? backgroundColor;
  final Widget body;
}
