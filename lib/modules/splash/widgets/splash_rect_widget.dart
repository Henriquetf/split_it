import 'package:flutter/material.dart';

enum SplashRectDirection {
  LEFT,
  RIGHT,
}

const _rectLeftAsset = "assets/images/rect-left.png";
const _rectRightAsset = "assets/images/rect-right.png";

class SplashRect extends StatelessWidget {
  final SplashRectDirection direction;
  final VerticalDirection verticalDirection;
  final CrossAxisAlignment horizontalDirection;

  const SplashRect({
    Key? key,
    this.direction = SplashRectDirection.RIGHT,
    this.verticalDirection = VerticalDirection.down,
    this.horizontalDirection = CrossAxisAlignment.start,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final assetName = direction == SplashRectDirection.RIGHT ? _rectRightAsset : _rectLeftAsset;

    return Column(
      verticalDirection: verticalDirection,
      crossAxisAlignment: horizontalDirection,
      children: [
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            assetName,
            width: 198.0,
            height: 98.0,
          ),
        ),
        SizedBox(
          height: 24.0,
        ),
        Opacity(
          opacity: 0.2,
          child: Image.asset(
            assetName,
            width: 114.0,
            height: 58.0,
          ),
        ),
      ],
    );
  }
}
