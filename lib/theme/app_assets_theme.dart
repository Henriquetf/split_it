abstract class AssetsThemeImages {
  String get logo;
  String get emoji;
  String get appleIcon;
  String get googleIcon;
}

abstract class AssetsTheme {
  AssetsThemeImages get images;
}

class AppImagesAssetsDefault implements AssetsThemeImages {
  @override
  String get logo => _asset("logo.png");
  @override
  String get emoji => _asset("emoji.png");

  @override
  String get appleIcon => _asset("apple_icon.png");
  @override
  String get googleIcon => _asset("google_icon.png");

  String _asset(String filename) {
    return "assets/images/$filename";
  }
}

class AppAssetsDefault implements AssetsTheme {
  @override
  AssetsThemeImages get images => AppImagesAssetsDefault();
}
