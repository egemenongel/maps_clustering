enum SvgIcons {
  add('add'),
  clusterGreen('cluster_green'),
  clusterBlue('cluster_blue'),
  clusterRed('cluster_red'),
  filter('filter'),
  map('map'),
  mapBold('map_bold'),
  others('others'),
  othersBold('others_bold'),
  pinBlack('pin_black'),
  pinBlue('pin_blue'),
  pinGreen('pin_green'),
  pinPurple('pin_purple'),
  pinRed('pin_red'),
  pinYellow('pin_yellow'),
  reports('reports'),
  reportsBold('reports_bold'),
  search('search'),
  summary('summary'),
  summaryBold('summary_bold'),
  track('track'),
  trackBold('track_bold'),
  ;

  const SvgIcons(this.slug);
  final String slug;

  String get path => 'assets/icons/$slug.svg';
}
