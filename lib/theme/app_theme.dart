import 'package:split_it/theme/app_assets_theme.dart';
import 'package:split_it/theme/app_colors_theme.dart';
import 'package:split_it/theme/app_gradients_theme.dart';
import 'package:split_it/theme/app_text_styles_theme.dart';

class AppTheme {
  static AppColors get colors => AppColorsDefault();
  static AppGradients get gradients => AppGradientsDefault(AppGradientValuesDefault());
  static AssetsTheme get assets => AppAssetsDefault();
  static AppTextStyles get textStyles => AppTextStylesDefault();
}
