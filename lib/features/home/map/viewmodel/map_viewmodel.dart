import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobiliz/core/models/location_model.dart';
import 'package:mobiliz/features/home/map/repository/map_repository.dart';
import 'package:mobiliz/features/home/map/view/map_view.dart';

class MapViewModel extends ChangeNotifier {
  final List<LocationModel> _locations = [];
  final List<Marker> _markers = [];
  bool _isLoading = false;
  String? _errorMessage;

  final List<int> randomNumbers = [];
  List<LocationModel> get locations => _locations;
  List<Marker> get markers => _markers;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  final _repository = MapRepository();

  double currentZoom = 6.0;
  final double zoomThreshold = 10.0;
  List<String> iconPaths = [
    'assets/icons/pin_black.svg',
    'assets/icons/pin_blue.svg',
    'assets/icons/pin_green.svg',
    'assets/icons/pin_purple.svg',
    'assets/icons/pin_red.svg',
    'assets/icons/pin_yellow.svg'
  ];

  void init() {
    _initializeMarkers();
  }

  void onMapMove(MapEvent event) {
    if (event is MapEventMove && event.camera.zoom != currentZoom) {
      final oldZoom = currentZoom;
      currentZoom = event.camera.zoom;
      notifyListeners();
      if (currentZoom >= zoomThreshold) {
        log(_markers.length.toString());
      }
      if ((oldZoom < zoomThreshold && currentZoom >= zoomThreshold) ||
          (oldZoom >= zoomThreshold && currentZoom < zoomThreshold)) {
        _markers.clear();

        notifyListeners();

        log('Zoom threshold crossed. New zoom: $currentZoom');
      }
    }
  }

  Future<void> _initializeMarkers() async {
    await fetchLocations();
    // for (var i = 0; i < _locations.length; i++) {
    //   randomNumbers.add(math.Random().nextInt(iconPaths.length));
    // }
    // createMarkers();
  }

  void createMarkers() {
    final isZoomedIn = currentZoom >= zoomThreshold;
    _markers.clear();
    notifyListeners();

    for (var i = 0; i < _locations.length; i++) {
      _markers.add(
        Marker(
          height: 40,
          width: 40,
          point: LatLng(_locations[i].lat, _locations[i].lon),
          child: Stack(
            children: [
              if (isZoomedIn)
                SvgPicture.asset(
                  iconPaths[randomNumbers[i]],
                )
              else ...[
                ClusterPin(
                  assetPath: 'assets/icons/cluster_green.svg',
                  count: 1,
                )
              ]
            ],
          ),
        ),
      );
    }
    notifyListeners();
  }

  Future<List<LocationModel>?> fetchLocations() async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _repository.getLocations();
      if (_locations.isEmpty) {
        _locations.addAll(response.data!);
      }
      return response.data!;
    } catch (e) {
      _errorMessage = e.toString();
    }

    _isLoading = false;
    notifyListeners();
    return null;
  }
}
