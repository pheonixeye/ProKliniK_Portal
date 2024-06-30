class Assets {
  const Assets();

  static const String icon = 'assets/images/icon.png';
  static const String hero = 'assets/images/hero.png';
  static const String feat_1 = 'assets/images/feat_2.png';

  static String featureImage(int index) {
    return 'assets/images/feat_$index.png';
  }
}
