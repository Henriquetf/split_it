abstract class AppImagesAssets {
  String get logo;
}

abstract class AppAssets {
  AppImagesAssets get images;
}

class AppImagesAssetsDefault implements AppImagesAssets {
  @override
  String get logo => _path("logo.png");

  String _path(String filename) {
    return "assets/images/$filename";
  }
}

class AppAssetsDefault implements AppAssets {
  @override
  AppImagesAssets get images => AppImagesAssetsDefault();
}
