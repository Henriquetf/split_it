import 'package:flutter/material.dart';
import 'package:split_it/utils/math.dart';

abstract class AppGradients {
  Gradient get background;
  Gradient get rect;
}

abstract class AppGradientValues {
  Color get backgroundDarkColor;
  Color get backgroundLightColor;

  double get backgroundDarkStop;
  double get backgroundLightStop;

  double get backgroundRotation;

  Color get rectDarkColor;
  Color get rectLightColor;

  double get rectDarkStop;
  double get rectLightStop;
}

class AppGradientValuesDefault implements AppGradientValues {
  Color get backgroundDarkColor => const Color(0xFF40B28C);
  Color get backgroundLightColor => const Color(0xFF45CC93);

  double get backgroundDarkStop => 0.0;
  double get backgroundLightStop => 1.0;

  double get backgroundRotation => radians(135);

  Color get rectDarkColor => const Color(0x004DE5A6);
  Color get rectLightColor => const Color(0xFF00FF94);

  double get rectDarkStop => 0.0;
  double get rectLightStop => 1.0;
}

class AppGradientsDefault implements AppGradients {
  final AppGradientValues values;

  const AppGradientsDefault(this.values);

  @override
  Gradient get background => LinearGradient(
        colors: [
          values.backgroundDarkColor,
          values.backgroundLightColor,
        ],
        stops: [
          values.backgroundDarkStop,
          values.backgroundLightStop,
        ],
        transform: GradientRotation(values.backgroundRotation),
      );

  @override
  Gradient get rect => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          values.rectDarkColor,
          values.rectLightColor,
        ],
        stops: [
          values.rectDarkStop,
          values.rectLightStop,
        ],
      );
}
