enum SvgIcons {
  pinBlack('pin_black'),
  pinBlue('pin_blue'),
  pinGreen('pin_green'),
  pinPurple('pin_purple'),
  pinRed('pin_red'),
  pinYellow('pin_yellow'),
  cluster10('cluster_10'),
  cluster50('cluster_50'),
  cluster200('cluster_200'),
  ;

  const SvgIcons(this.slug);
  final String slug;

  String get path => 'assets/icons/$slug.svg';
}
