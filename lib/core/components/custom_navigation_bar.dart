import 'package:flutter/material.dart';
import 'package:mobiliz/core/app_theme.dart';
import 'package:mobiliz/core/constants/app_colors.dart';

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
      backgroundColor: AppColors.white50,
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
                  Text(
                    item.label!,
                    style: AppTheme.instance.theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),
          activeIcon: Stack(
            children: [
              Column(
                children: [
                  item.activeIcon,
                  Text(
                    item.label!,
                    style: AppTheme.instance.theme.textTheme.bodySmall
                        ?.copyWith(
                            color: AppColors.main600,
                            fontWeight: FontWeight.w600),
                  ),
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
                      color: AppColors.main500,
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
  final bool showDot;
}
