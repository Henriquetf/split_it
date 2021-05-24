import 'package:flutter/material.dart';
import 'package:split_it/modules/splash/widgets/splash_rect_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: AppTheme.gradients.background,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SplashRect(),
                _buildLogo(),
                SplashRect(
                  direction: SplashRectDirection.LEFT,
                  verticalDirection: VerticalDirection.up,
                  horizontalDirection: CrossAxisAlignment.end,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return Image.asset(
      "assets/images/logo.png",
      width: 128.0,
      height: 112.0,
    );
  }
}
