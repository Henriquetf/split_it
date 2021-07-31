import 'package:flutter/material.dart';
import 'package:split_it/utils/math.dart';

abstract class AppGradients {
  Gradient get background;
  Gradient get rect;
  Gradient get title;
}

class LinearGradientColors {
  final Color dark;
  final double darkStop = 0.0;

  final Color light;
  final double lightStop = 1.0;

  const LinearGradientColors({
    required this.dark,
    required this.light,
  });

  List<Color> darkToLightColors() {
    return [
      this.dark,
      this.light,
    ];
  }

  List<double> darkToLightStops() {
    return [
      this.darkStop,
      this.lightStop,
    ];
  }
}

abstract class AppGradientValues {
  LinearGradientColors get backgroundColors;
  double get backgroundRotation;
  LinearGradientColors get rectColors;
  LinearGradientColors get titleColors;
}

class AppGradientValuesDefault implements AppGradientValues {
  @override
  LinearGradientColors get backgroundColors => const LinearGradientColors(
        dark: Color(0xFF40B28C),
        light: Color(0xFF45CC93),
      );

  @override
  double get backgroundRotation => radians(135);

  @override
  LinearGradientColors get rectColors => const LinearGradientColors(
        dark: Color(0x004DE5A6),
        light: Color(0xFF00FF94),
      );

  @override
  LinearGradientColors get titleColors => const LinearGradientColors(
        dark: Color(0xFF40B28C),
        light: Color(0xFF45CC93),
      );
}

class AppGradientsDefault implements AppGradients {
  final AppGradientValues values;

  const AppGradientsDefault(this.values);

  @override
  Gradient get background => LinearGradient(
        colors: values.backgroundColors.darkToLightColors(),
        stops: values.backgroundColors.darkToLightStops(),
        transform: GradientRotation(values.backgroundRotation),
      );

  @override
  Gradient get rect => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.centerRight,
        colors: values.rectColors.darkToLightColors(),
        stops: values.rectColors.darkToLightStops(),
      );

  @override
  Gradient get title => LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: values.titleColors.darkToLightColors(),
      );
}
