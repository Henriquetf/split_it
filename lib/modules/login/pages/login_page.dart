import 'package:flutter/material.dart';
import 'package:split_it/modules/home/pages/home_page.dart';
import 'package:split_it/modules/login/pages/login_controller.dart';
import 'package:split_it/modules/login/pages/login_state.dart';
import 'package:split_it/widgets/gradient_text_widget.dart';
import 'package:split_it/modules/login/widgets/social_button_widget.dart';
import 'package:split_it/modules/login/widgets/login_tile_widget.dart';
import 'package:split_it/theme/app_theme.dart';

class LoginPage extends StatefulWidget {
  static const routeName = "/login";

  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginController controller;

  @override
  void initState() {
    controller = LoginController(
      onUpdate: () {
        if (controller.state is LoginStateSuccess) {
          final user = (controller.state as LoginStateSuccess).user;

          Navigator.of(context).pushReplacementNamed(HomePage.routeName, arguments: user);
        } else {
          setState(() {});
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTitle(),
            _buildLoginArea(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GradientText(
        text: Text(
          "Divida\n"
          "contas\n"
          "com seus\n"
          "amigos",
          style: AppTheme.textStyles.title,
        ),
        gradient: AppTheme.gradients.title,
      ),
    );
  }

  Widget _buildLoginArea() {
    return Column(
      children: [
        if (controller.state is LoginStateLoading)
          CircularProgressIndicator()
        else
          _buildLoginText(),
        SizedBox(
          height: 32.0,
        ),
        _buildButtons(),
      ],
    );
  }

  Widget _buildLoginText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: LoginTile(
        icon: Image.asset(
          AppTheme.assets.images.emoji,
          height: 36.0,
          width: 36.0,
        ),
        text: Text(
          "Faça seu login com\n"
          "uma das contas abaixo",
          style: AppTheme.textStyles.description,
        ),
      ),
    );
  }

  Widget _buildButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SocialButton(
          onTap: controller.googleSignIn,
          child: LoginTile(
            icon: Image.asset(
              AppTheme.assets.images.googleIcon,
              width: 24.0,
              height: 24.0,
            ),
            text: Text(
              'Entrar com Google',
              textAlign: TextAlign.center,
              style: AppTheme.textStyles.button,
            ),
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        // SocialButton(
        //   onTap: () {},
        //   child: LoginTile(
        //     icon: Image.asset(
        //       AppTheme.assets.images.appleIcon,
        //       width: 24.0,
        //       height: 24.0,
        //     ),
        //     text: Text(
        //       'Entrar com Apple',
        //       textAlign: TextAlign.center,
        //       style: AppTheme.textStyles.button,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
