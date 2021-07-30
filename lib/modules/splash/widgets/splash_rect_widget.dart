import 'dart:math';

import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

enum SplashRectAlignment {
  LEFT,
  RIGHT,
}

class SplashRect extends StatelessWidget {
  final SplashRectAlignment alignment;

  const SplashRect({
    Key? key,
    required this.alignment,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLeftAlignment = alignment == SplashRectAlignment.LEFT;
    final rotateAngle = isLeftAlignment ? 0.0 : pi;
    final verticalDirection = isLeftAlignment ? VerticalDirection.down : VerticalDirection.up;
    final horizontalDirection = isLeftAlignment ? CrossAxisAlignment.start : CrossAxisAlignment.end;

    return Column(
      verticalDirection: verticalDirection,
      crossAxisAlignment: horizontalDirection,
      children: [
        _buildRect(
          rotateAngle,
          width: 198.0,
          height: 98.0,
        ),
        const SizedBox(
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
