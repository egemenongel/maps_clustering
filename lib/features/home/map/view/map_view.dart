import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobiliz/core/components/loading_widget.dart';
import 'package:mobiliz/core/constants/app_colors.dart';
import 'package:mobiliz/core/constants/app_constants.dart';
import 'package:mobiliz/core/constants/assets.dart';
import 'package:mobiliz/features/home/map/view/widgets/cluster_pin.dart';
import 'package:mobiliz/features/home/map/viewmodel/map_viewmodel.dart';
import 'package:provider/provider.dart';

@RoutePage()
class MapView extends StatelessWidget {
  const MapView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapViewModel(),
      child: _MapViewContent(),
    );
  }
}

class _MapViewContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _AppBar(),
      body: _Map(),
      floatingActionButton: _Fab(),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSizeWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Harita'),
      titleSpacing: 20,
      actions: [
        IconButton(
          icon: SvgPicture.asset(SvgIcons.search.path),
          onPressed: () {},
        ),
        IconButton(
          icon: SvgPicture.asset(SvgIcons.filter.path),
          onPressed: () {},
        ),
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _Map extends StatelessWidget {
  const _Map();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MapViewModel>();
    final isLoading = viewModel.isLoading;

    if (isLoading) {
      return LoadingWidget();
    }
    return FlutterMap(
      options: MapOptions(
        onMapEvent: viewModel.onMapEvent,
        initialCenter: viewModel.initialCenter,
        initialZoom: viewModel.initialZoom,
        maxZoom: viewModel.maxZoom,
        minZoom: 5.0,
        interactionOptions: const InteractionOptions(
            flags: InteractiveFlag.pinchZoom | InteractiveFlag.drag),
      ),
      children: <Widget>[
        _TileLayer(),
        _MarkerLayer(),
      ],
    );
  }
}

class _TileLayer extends StatelessWidget {
  const _TileLayer();

  @override
  Widget build(BuildContext context) {
    return TileLayer(
      urlTemplate: AppConstants.mapTiles.first,
      subdomains: AppConstants.mapSubDomains,
      retinaMode: true,
    );
  }
}

class _MarkerLayer extends StatelessWidget {
  const _MarkerLayer();

  @override
  Widget build(BuildContext context) {
    return Selector<MapViewModel, List<Marker>>(
      selector: (_, vM) => vM.markers,
      builder: (_, markers, __) {
        return MarkerClusterLayerWidget(
          options: MarkerClusterLayerOptions(
            maxClusterRadius: 70,
            showPolygon: false,
            spiderfyCluster: false,
            size: const Size(50, 50),
            alignment: Alignment.center,
            padding: const EdgeInsets.all(50),
            maxZoom: 15,
            inside: true,
            markers: markers,
            builder: (context, markers) {
              final assetPath = context
                  .read<MapViewModel>()
                  .getClusterAssetPath(markers.length);
              return ClusterPin(
                assetPath: assetPath,
                count: markers.length,
              );
            },
          ),
        );
      },
    );
  }
}

class _Fab extends StatelessWidget {
  const _Fab();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      width: 64,
      child: FloatingActionButton(
        elevation: 0,
        shape: CircleBorder(),
        onPressed: () {},
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.main600,
            ),
            gradient: LinearGradient(
              colors: [
                AppColors.main500,
                AppColors.main300,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.white50.withValues(
                  alpha: 0.2,
                ),
                offset: Offset(0, -4),
                blurRadius: 1,
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: SvgPicture.asset(
              SvgIcons.add.path,
            ),
          ),
        ),
      ),
    );
  }
}
