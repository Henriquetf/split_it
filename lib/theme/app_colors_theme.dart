import 'package:flutter/material.dart';

abstract class AppColors {
  Color get backgroundSecondary;
  Color get backgroundPrimary;
  Color get title;
  Color get description;
  Color get button;
  Color get border;
  Color get buttonSplashColor;
}

class AppColorsDefault implements AppColors {
  @override
  Color get backgroundSecondary => const Color(0xFF40B38C);

  @override
  Color get backgroundPrimary => const Color(0xFFFFFFFF);

  @override
  Color get title => const Color(0xFF40B28C);

  @override
  Color get description => const Color(0xFF666666);

  @override
  Color get button => const Color(0xFF666666);

  @override
  Color get border => const Color(0xFFDCE0E5);

  @override
  Color get buttonSplashColor => const Color(0xBB45CC93);
}
