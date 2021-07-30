import 'package:split_it/theme/app_assets.dart';
import 'package:split_it/theme/app_colors.dart';
import 'package:split_it/theme/app_gradients.dart';

class AppTheme {
  static AppColors get colors => AppColorsDefault();
  static AppGradients get gradients => AppGradientsDefault(AppGradientValuesDefault());
  static AppAssets get assets => AppAssetsDefault();
}
