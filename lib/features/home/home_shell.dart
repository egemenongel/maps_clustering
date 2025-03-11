import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiliz/core/components/custom_navigation_bar.dart';
import 'package:mobiliz/core/config/router/router.gr.dart';
import 'package:mobiliz/core/constants/app_colors.dart';
import 'package:mobiliz/core/constants/assets.dart';

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
                color: AppColors.textColor50,
              ),
            ),
          ),
          child: CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
            items: [
              BottomNavigationBarItemWithDot(
                label: 'Özet',
                icon: SvgPicture.asset(SvgIcons.summary.path),
                activeIcon: SvgPicture.asset(SvgIcons.summaryBold.path),
              ),
              BottomNavigationBarItemWithDot(
                label: 'Filo Takip',
                icon: SvgPicture.asset(SvgIcons.track.path),
                activeIcon: SvgPicture.asset(SvgIcons.trackBold.path),
              ),
              BottomNavigationBarItemWithDot(
                label: 'Harita',
                icon: SvgPicture.asset(SvgIcons.map.path),
                activeIcon: SvgPicture.asset(SvgIcons.mapBold.path),
              ),
              BottomNavigationBarItemWithDot(
                label: 'Raporlar',
                icon: SvgPicture.asset(SvgIcons.reports.path),
                activeIcon: SvgPicture.asset(SvgIcons.reportsBold.path),
              ),
              BottomNavigationBarItemWithDot(
                label: 'Diğer',
                icon: SvgPicture.asset(SvgIcons.others.path),
                activeIcon: SvgPicture.asset(SvgIcons.othersBold.path),
              ),
            ],
          ),
        );
      },
    );
  }
}
