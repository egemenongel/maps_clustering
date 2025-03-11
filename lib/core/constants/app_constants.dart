class AppConstants {
  AppConstants._();

  static const String appName = 'Mobiliz';
  static const String baseUrl =
      'https://turkey-geolocation-rest-api.vercel.app/';
  static const mapTiles = [
    'https://{s}.google.com/vt/lyrs=m&hl=tr&x={x}&y={y}&z={z}',
    'https://{s}.google.com/vt/lyrs=s,h&hl=tr&x={x}&y={y}&z={z}',
    'https://{s}.google.com/vt/lyrs=p&hl=tr&x={x}&y={y}&z={z}',
  ];

  static const mapSubDomains = ['mt0', 'mt1', 'mt2', 'mt3'];
}
