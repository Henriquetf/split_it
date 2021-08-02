import 'package:flutter/material.dart';
import 'package:split_it/theme/app_theme.dart';

class ErrorPage extends StatelessWidget {
  static const routeName = "/error";

  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "Erro na inicialização do Firebase",
          style: AppTheme.textStyles.description,
        ),
      ),
    );
  }
}
