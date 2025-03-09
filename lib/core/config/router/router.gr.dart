// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:mobiliz/features/home/home_shell.dart' as _i1;
import 'package:mobiliz/features/home/map/map_view.dart' as _i2;
import 'package:mobiliz/features/home/others/others_view.dart' as _i3;
import 'package:mobiliz/features/home/reports/reports_view.dart' as _i4;
import 'package:mobiliz/features/home/summary/summary_view.dart' as _i5;
import 'package:mobiliz/features/home/track/track_view.dart' as _i6;

/// generated route for
/// [_i1.HomeView]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeView();
    },
  );
}

/// generated route for
/// [_i2.MapView]
class MapRoute extends _i7.PageRouteInfo<void> {
  const MapRoute({List<_i7.PageRouteInfo>? children})
    : super(MapRoute.name, initialChildren: children);

  static const String name = 'MapRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.MapView();
    },
  );
}

/// generated route for
/// [_i3.OthersView]
class OthersRoute extends _i7.PageRouteInfo<void> {
  const OthersRoute({List<_i7.PageRouteInfo>? children})
    : super(OthersRoute.name, initialChildren: children);

  static const String name = 'OthersRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.OthersView();
    },
  );
}

/// generated route for
/// [_i4.ReportsView]
class ReportsRoute extends _i7.PageRouteInfo<void> {
  const ReportsRoute({List<_i7.PageRouteInfo>? children})
    : super(ReportsRoute.name, initialChildren: children);

  static const String name = 'ReportsRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.ReportsView();
    },
  );
}

/// generated route for
/// [_i5.SummaryView]
class SummaryRoute extends _i7.PageRouteInfo<void> {
  const SummaryRoute({List<_i7.PageRouteInfo>? children})
    : super(SummaryRoute.name, initialChildren: children);

  static const String name = 'SummaryRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.SummaryView();
    },
  );
}

/// generated route for
/// [_i6.TrackView]
class TrackRoute extends _i7.PageRouteInfo<void> {
  const TrackRoute({List<_i7.PageRouteInfo>? children})
    : super(TrackRoute.name, initialChildren: children);

  static const String name = 'TrackRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.TrackView();
    },
  );
}
