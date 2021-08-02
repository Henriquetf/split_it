import 'package:flutter/scheduler.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/modules/login/pages/login_state.dart';

class LoginController {
  LoginState state = LoginStateInitial();
  VoidCallback onUpdate;

  LoginController({required this.onUpdate});

  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      onUpdate();

      final account = await _googleSignIn.signIn();

      if (account == null) {
        throw Exception("User login aborted.");
      }

      final newUser = UserModel.fromGoogleAccount(account);

      state = LoginStateSuccess(user: newUser);
      onUpdate();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      onUpdate();
    }
  }
}
