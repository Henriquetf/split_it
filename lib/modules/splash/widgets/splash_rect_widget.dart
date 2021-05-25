import 'dart:math';

import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

enum SplashRectDirection {
  LEFT,
  RIGHT,
}

class SplashRect extends StatelessWidget {
  final SplashRectDirection direction;

  const SplashRect({
    Key? key,
    required this.direction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLeftDirection = direction == SplashRectDirection.LEFT;
    final rotateAngle = isLeftDirection ? pi : 0.0;
    final verticalDirection = isLeftDirection ? VerticalDirection.down : VerticalDirection.up;
    final horizontalDirection = isLeftDirection ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      verticalDirection: verticalDirection,
      crossAxisAlignment: horizontalDirection,
      children: [
        _buildRect(
          rotateAngle,
          width: 198.0,
          height: 98.0,
        ),
        SizedBox(
          height: 24.0,
        ),
        _buildRect(
          rotateAngle,
          width: 114.0,
          height: 58.0,
        ),
      ],
    );
  }

  Widget _buildRect(
    double rotateAngle, {
    required double width,
    required double height,
  }) {
    return Transform.rotate(
      angle: rotateAngle,
      child: Opacity(
        opacity: 0.2,
        child: Container(
          decoration: BoxDecoration(
            gradient: AppTheme.gradients.rect,
            borderRadius: BorderRadius.circular(8.0),
          ),
          width: width,
          height: height,
        ),
      ),
    );
  }
}
