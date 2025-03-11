import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobiliz/core/constants/assets.dart';
import 'package:mobiliz/core/models/location_model.dart';
import 'package:mobiliz/features/home/map/repository/map_repository.dart';
import 'package:mobiliz/features/home/map/view/widgets/cluster_pin.dart';

class MapViewModel extends ChangeNotifier {
  int totalLocations = 500;
  int batchSize = 100;
  List<String> iconPaths = [
    SvgIcons.pinBlack.path,
    SvgIcons.pinBlue.path,
    SvgIcons.pinGreen.path,
    SvgIcons.pinPurple.path,
    SvgIcons.pinRed.path,
    SvgIcons.pinYellow.path,
  ];
  final double zoomThreshold = 10.0;
  final LatLng initialCenter = LatLng(39.9334, 32.8597);
  final double initialZoom = 6.0;
  final double maxZoom = 15.0;
  bool _isLoading = false;
  double _currentZoom = 6.0;
  List<Marker> _markers = [];
  List<int> randomNumbers = [];
  final List<LocationModel> _locations = [];
  bool _disposed = false;

  double get currentZoom => _currentZoom;
  List<Marker> get markers => _markers;
  bool get isZoomedIn => _currentZoom >= zoomThreshold;
  bool get isLoading => _isLoading;

  final _repository = MapRepository();

  MapViewModel() {
    _initializeMarkers();
  }

  Future<void> _initializeMarkers() async {
    setLoading();
    for (var i = 0; i < totalLocations; i++) {
      randomNumbers.add(math.Random().nextInt(iconPaths.length));
    }
    for (int skip = 0; skip < totalLocations; skip += batchSize) {
      final response = await _repository.getLocations(skip: skip);
      if (response.data?.isNotEmpty ?? false) {
        _locations.addAll(response.data!);
        notifyListeners();
      }
    }
    createMarkers();
    setLoading();
  }

  void createMarkers() {
    _markers = _locations.map((location) {
      return Marker(
          height: 40,
          width: 40,
          point: LatLng(location.lat, location.lon),
          child: Stack(
            children: [
              if (isZoomedIn)
                SvgPicture.asset(
                  iconPaths[randomNumbers[_locations.indexOf(location)]],
                )
              else ...[
                ClusterPin(
                  assetPath: SvgIcons.clusterGreen.path,
                  count: 1,
                )
              ]
            ],
          ));
    }).toList();
  }

  void setLoading() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void onMapEvent(MapEvent event) {
    if (event is MapEventMove && event.camera.zoom != _currentZoom) {
      final oldZoom = _currentZoom;
      _currentZoom = event.camera.zoom;

      if ((oldZoom < zoomThreshold && _currentZoom >= zoomThreshold) ||
          (oldZoom >= zoomThreshold && _currentZoom < zoomThreshold)) {
        createMarkers();
        notifyListeners();
      }
    }
  }

  String getClusterAssetPath(int markerCount) {
    if (markerCount <= 10) {
      return SvgIcons.clusterGreen.path;
    } else if (markerCount <= 50) {
      return SvgIcons.clusterBlue.path;
    } else {
      return SvgIcons.clusterRed.path;
    }
  }

  @override
  void dispose() {
    _disposed = true;
    super.dispose();
  }

  @override
  void notifyListeners() {
    if (!_disposed) {
      super.notifyListeners();
    }
  }
}
