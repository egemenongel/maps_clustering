import 'package:auto_route/auto_route.dart';
import 'package:mobiliz/core/config/router/router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'View,Route')
class AppRouter extends RootStackRouter {
  AppRouter._();
  static final AppRouter _instance = AppRouter._();
  static AppRouter get instance => _instance;

  @override
  List<AutoRoute> get routes {
    return [
      AutoRoute(
        page: HomeRoute.page,
        initial: true,
        children: [
          AutoRoute(
            path: 'summary',
            page: SummaryRoute.page,
          ),
          AutoRoute(
            path: 'track',
            page: TrackRoute.page,
            maintainState: false,
          ),
          AutoRoute(
            path: 'map',
            page: MapRoute.page,
            maintainState: false,
          ),
          AutoRoute(
            path: 'reports',
            page: ReportsRoute.page,
          ),
          AutoRoute(
            path: 'others',
            page: OthersRoute.page,
          )
        ],
      )
    ];
  }
}
