import 'dart:math';

import 'package:flutter/material.dart';

abstract class AppGradients {
  Gradient get background;
  Gradient get rect;
}

class AppGradientsDefault implements AppGradients {
  @override
  Gradient get background => const LinearGradient(
        colors: [
          Color(0xFF40B28C),
          Color(0xFF45CC93),
        ],
        stops: [
          0.0,
          1.0,
        ],
        transform: GradientRotation(2.35619 * pi),
      );

  @override
  Gradient get rect => const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF00FF94),
          Color(0x004DE5A6),
        ],
        stops: [
          0.0,
          1.0,
        ],
      );
}
