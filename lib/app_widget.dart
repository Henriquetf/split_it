import 'package:flutter/material.dart';
import 'package:split_it/modules/error/pages/error_page.dart';
import 'package:split_it/modules/home/pages/home_page.dart';
import 'package:split_it/modules/login/pages/login_page.dart';
import 'package:split_it/modules/splash/pages/splash_page.dart';

class SplitItWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Split.it",
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (context) => SplashPage(),
        LoginPage.routeName: (context) => LoginPage(),
        ErrorPage.routeName: (context) => ErrorPage(),
        HomePage.routeName: (context) => HomePage(),
      },
    );
  }
}
