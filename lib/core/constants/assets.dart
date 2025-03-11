enum SvgIcons {
  pinBlack('pin_black'),
  pinBlue('pin_blue'),
  pinGreen('pin_green'),
  pinPurple('pin_purple'),
  pinRed('pin_red'),
  pinYellow('pin_yellow'),
  clusterGreen('cluster_green'),
  clusterBlue('cluster_blue'),
  clusterRed('cluster_red'),
  ;

  const SvgIcons(this.slug);
  final String slug;

  String get path => 'assets/icons/$slug.svg';
}
