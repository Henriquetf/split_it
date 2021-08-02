import 'package:flutter/material.dart';
import 'package:split_it/firebase_initializer.dart';
import 'package:split_it/modules/error/pages/error_page.dart';
import 'package:split_it/modules/login/pages/login_page.dart';
import 'package:split_it/modules/splash/widgets/splash_rect_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class SplashPage extends StatelessWidget {
  static const routeName = "/splash";

  void _onCompleted(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(LoginPage.routeName);
  }

  void _onError(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(ErrorPage.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FirebaseInitializer(
        onCompleted: () => this._onCompleted(context),
        onError: () => this._onError(context),
        child: _buildBody(),
      ),
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
