import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:mobiliz/core/components/custom_navigation_bar.dart';
import 'package:mobiliz/core/config/router/router.gr.dart';

@RoutePage()
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsScaffold(
      routes: [
        SummaryRoute(),
        TrackRoute(),
        MapRoute(),
        ReportsRoute(),
        OthersRoute(),
      ],
      bottomNavigationBuilder: (final _, final tabsRouter) {
        return Container(
          height: 117,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                color: Color(0xffE9E9E9),
              ),
            ),
          ),
          child: CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: [
              BottomNavigationBarItemWithDot(
                label: 'Özet',
                icon: Icon(IconsaxPlusLinear.note_2),
                activeIcon: Icon(IconsaxPlusBold.note_2),
              ),
              BottomNavigationBarItemWithDot(
                label: 'Filo Takip',
                icon: Icon(IconsaxPlusLinear.smart_car),
                activeIcon: Icon(IconsaxPlusBold.smart_car),
              ),
              BottomNavigationBarItemWithDot(
                label: 'Harita',
                icon: Icon(IconsaxPlusLinear.map_1),
                activeIcon: Icon(IconsaxPlusBold.map_1),
              ),
              BottomNavigationBarItemWithDot(
                label: 'Raporlar',
                icon: Icon(IconsaxPlusLinear.graph),
                activeIcon: Icon(IconsaxPlusBold.graph),
              ),
              BottomNavigationBarItemWithDot(
                  label: 'Diğer',
                  icon: Icon(IconsaxPlusLinear.element_equal),
                  activeIcon: Icon(IconsaxPlusBold.element_equal),
                  showDot: true),
            ],
          ),
        );
      },
    );
  }
}
