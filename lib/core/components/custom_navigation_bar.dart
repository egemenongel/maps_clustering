import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final List<BottomNavigationBarItemWithDot> items;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      onTap: onTap,
      items: items.map((item) {
        bool isSelected = items.indexOf(item) == currentIndex;
        return BottomNavigationBarItem(
          icon: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                children: [
                  item.icon,
                  Text(item.label!),
                ],
              ),
            ],
          ),
          activeIcon: Stack(
            children: [
              Column(
                children: [
                  item.activeIcon,
                  Text(item.label!),
                  SizedBox(height: 4),
                ],
              ),
              if (isSelected)
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    width: 4,
                    height: 4,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff3DAE2B),
                    ),
                  ),
                ),
            ],
          ),
          label: '',
        );
      }).toList(),
    );
  }
}

class BottomNavigationBarItemWithDot extends BottomNavigationBarItem {
  const BottomNavigationBarItemWithDot({
    required super.icon,
    Widget? activeIcon,
    super.label,
    super.backgroundColor,
    super.tooltip,
    this.showDot = false,
  }) : super(
          activeIcon: activeIcon ?? icon,
        );

  /// Whether to show a small dot under the label when active.
  final bool showDot;
}
