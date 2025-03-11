import 'dart:developer';
import 'dart:math' as math;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:latlong2/latlong.dart';
import 'package:mobiliz/core/constants/app_constants.dart';
import 'package:mobiliz/core/constants/assets.dart';

@RoutePage()
class MapView extends StatefulWidget {
  const MapView({super.key});

  @override
  State<StatefulWidget> createState() => ClusteringBodyState();
}

class ClusteringBodyState extends State<MapView> {
  List<String> iconPaths = [
    SvgIcons.pinBlack.path,
    SvgIcons.pinBlue.path,
    SvgIcons.pinGreen.path,
    SvgIcons.pinPurple.path,
    SvgIcons.pinRed.path,
    SvgIcons.pinYellow.path,
  ];
  double currentZoom = 6.0;
  final double zoomThreshold = 10.0;
  final List<int> randomNumbers = [];
  late List<Marker> markers;
  var latlongs = [
    {"lat": 37.1438001, "lon": 35.4984094},
    {"lat": 37.78936, "lon": 38.3141101},
    {"lat": 38.6852729, "lon": 30.6427411},
    {"lat": 39.667, "lon": 43.167},
    {"lat": 40.6569451, "lon": 35.7727169},
    {"lat": 39.7160439, "lon": 32.7059948},
    {"lat": 36.9279654, "lon": 30.7276865},
    {"lat": 41.160506, "lon": 41.8398627},
    {"lat": 37.7405798, "lon": 28.0676404},
    {"lat": 39.5400798, "lon": 28.0228793},
    {"lat": 40.1393647, "lon": 30.0482554},
    {"lat": 39.073803, "lon": 40.7296181},
    {"lat": 38.4950867, "lon": 42.1678372},
    {"lat": 40.6212099, "lon": 31.6460259},
    {"lat": 37.5183407, "lon": 30.1691254},
    {"lat": 39.9895878, "lon": 28.8944669},
    {"lat": 40.0549886, "lon": 26.9278292},
    {"lat": 40.6667691, "lon": 33.4526069},
    {"lat": 40.5698389, "lon": 34.7269292},
    {"lat": 37.8275892, "lon": 29.2389539},
    {"lat": 38.0814716, "lon": 40.4297767},
    {"lat": 41.1804499, "lon": 26.6222442},
    {"lat": 38.5824771, "lon": 39.396179},
    {"lat": 39.6073429, "lon": 39.2013209},
    {"lat": 39.7581897, "lon": 41.4032241},
    {"lat": 39.6821156, "lon": 31.0723476},
    {"lat": 36.9666307, "lon": 37.4074178},
    {"lat": 40.6531617, "lon": 38.5172032},
    {"lat": 40.2061415, "lon": 39.309437},
    {"lat": 37.495358, "lon": 44.1054777},
    {"lat": 36.3451332, "lon": 36.0748022},
    {"lat": 37.9465412, "lon": 30.9602093},
    {"lat": 36.8328277, "lon": 33.9685895},
    {"lat": 41.0766019, "lon": 29.052495},
    {"lat": 38.23166, "lon": 27.02997},
    {"lat": 40.4558435, "lon": 42.9979531},
    {"lat": 41.3680217, "lon": 33.7619177},
    {"lat": 38.75136515, "lon": 35.4354329461688},
    {"lat": 41.7078046, "lon": 27.6051334},
    {"lat": 39.3303066, "lon": 34.1265884},
    {"lat": 40.8216536, "lon": 29.9507184},
    {"lat": 38.0211951, "lon": 32.5224943},
    {"lat": 39.2522508, "lon": 29.4937732},
    {"lat": 38.4820156, "lon": 38.1035355},
    {"lat": 38.8574402, "lon": 28.0565711},
    {"lat": 37.7830345, "lon": 36.830655},
    {"lat": 37.3414854, "lon": 40.7476249},
    {"lat": 37.1642053, "lon": 28.2624288},
    {"lat": 40.0064162, "lon": -81.9984697},
    {"lat": 38.7235072, "lon": 34.7194168},
    {"lat": 38.0664691, "lon": 34.7051438},
    {"lat": 40.8292569, "lon": 37.4082764},
    {"lat": 40.9347897, "lon": 40.827136},
    {"lat": 40.7731834, "lon": 30.481606},
    {"lat": 41.2303557, "lon": 35.9683338},
    {"lat": 37.8646916, "lon": 42.0510294},
    {"lat": 41.6394277, "lon": 34.8681231},
    {"lat": 39.4191717, "lon": 37.1012388},
    {"lat": 41.1185843, "lon": 27.4144196},
    {"lat": 40.327747, "lon": 36.5539494},
    {"lat": 40.8849863, "lon": 39.822206},
    {"lat": 39.2197553, "lon": 39.4139674},
    {"lat": 37.2595198, "lon": 39.0408174},
    {"lat": 38.609666, "lon": 29.3306506},
    {"lat": 38.3249599, "lon": 43.6589825},
    {"lat": 39.7152422, "lon": 35.170998},
    {"lat": 41.250324, "lon": 31.8389738},
    {"lat": 38.4326291, "lon": 33.8976963},
    {"lat": 40.2023027, "lon": 40.2121599},
    {"lat": 37.1796848, "lon": 33.3383665},
    {"lat": 39.8860105, "lon": 33.8278992},
    {"lat": 37.7874104, "lon": 41.2573924},
    {"lat": 37.455253, "lon": 42.5212049},
    {"lat": 41.4947715, "lon": 32.4354255},
    {"lat": 41.0372501, "lon": 42.7462189},
    {"lat": 39.8945292, "lon": 43.9427459},
    {"lat": 40.6291846, "lon": 29.2500262},
    {"lat": 41.1110349, "lon": 32.6193901},
    {"lat": 36.7797231, "lon": 37.1416892},
    {"lat": 37.2517882, "lon": 36.2993502},
    {"lat": 40.8774545, "lon": 31.2009618}
  ];

  @override
  void initState() {
    for (var i = 0; i < latlongs.length; i++) {
      randomNumbers.add(math.Random().nextInt(iconPaths.length));
    }
    _createMarkers();

    super.initState();
  }

  void _createMarkers() {
    final isZoomedIn = currentZoom >= zoomThreshold;
    markers = [];
    for (var i = 0; i < latlongs.length; i++) {
      markers.add(
        Marker(
          height: 40,
          width: 40,
          point: LatLng(
            latlongs[i]['lat'] as double,
            latlongs[i]['lon'] as double,
          ),
          child: Stack(
            children: [
              if (isZoomedIn)
                SvgPicture.asset(
                  iconPaths[randomNumbers[i]],
                )
              else ...[
                ClusterPin(
                  assetPath: SvgIcons.clusterGreen.path,
                  count: 1,
                )
              ]
            ],
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harita'),
        actions: [
          IconButton(
            icon: Icon(IconsaxPlusLinear.search_normal_1),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(IconsaxPlusLinear.filter),
            onPressed: () {},
          ),
        ],
      ),
      body: FlutterMap(
        options: MapOptions(
          onMapEvent: (event) {
            if (event is MapEventMove && event.camera.zoom != currentZoom) {
              final oldZoom = currentZoom;
              currentZoom = event.camera.zoom;

              if ((oldZoom < zoomThreshold && currentZoom >= zoomThreshold) ||
                  (oldZoom >= zoomThreshold && currentZoom < zoomThreshold)) {
                setState(() {
                  _createMarkers();
                });
                log('Zoom threshold crossed. New zoom: $currentZoom');
              }
            }
          },
          initialCenter: LatLng(41.7078046, 27.6051334),
          initialZoom: currentZoom,
          maxZoom: 15,
        ),
        children: <Widget>[
          TileLayer(
            urlTemplate: AppConstants.mapUrl,
            subdomains: const ['a', 'b', 'c'],
          ),
          MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
              maxClusterRadius: 70,
              showPolygon: false,
              spiderfyCluster: false,
              size: const Size(40, 40),
              alignment: Alignment.center,
              padding: const EdgeInsets.all(50),
              maxZoom: 15,
              inside: true,
              markers: markers,
              onMarkersClustered: (p0) {
                log(p0.length.toString());
              },
              builder: (context, markers) {
                if (markers.length <= 10) {
                  return ClusterPin(
                    assetPath: SvgIcons.clusterGreen.path,
                    count: markers.length,
                  );
                } else if (markers.length <= 50) {
                  return ClusterPin(
                    assetPath: SvgIcons.clusterBlue.path,
                    count: markers.length,
                  );
                } else {
                  return ClusterPin(
                    assetPath: SvgIcons.clusterRed.path,
                    count: markers.length,
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        shape: CircleBorder(),
        onPressed: () {},
        child: Container(
          height: 64,
          width: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Color(0xff3DAE2B),
            border: Border.all(
              color: Color(0xff389e27),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.white.withValues(alpha: 0.2),
                offset: Offset(0, -4),
                blurRadius: 1,
                blurStyle: BlurStyle.inner,
              ),
            ],
          ),
          child: Icon(
            IconsaxPlusLinear.add,
            size: 44,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class ClusterPin extends StatelessWidget {
  const ClusterPin({
    super.key,
    required this.assetPath,
    required this.count,
  });
  final String assetPath;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          assetPath,
        ),
        Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              '$count',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
