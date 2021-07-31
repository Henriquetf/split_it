import 'package:flutter/material.dart';
import 'package:split_it/modules/splash/widgets/splash_rect_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
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
              SplashRect(alignment: SplashRectAlignment.LEFT),
              Image.asset(
                AppTheme.assets.images.logo,
                width: 128.0,
                height: 112.0,
              ),
              SplashRect(alignment: SplashRectAlignment.RIGHT),
            ],
          ),
        ),
      ),
    );
  }
}
