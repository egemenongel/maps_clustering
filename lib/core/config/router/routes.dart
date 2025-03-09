enum Routes {
  home('/'),
  summary('summary'),
  tracking('tracking'),
  map('map'),
  reports('reports'),
  others('others');

  const Routes(this.path);
  final String path;
}
