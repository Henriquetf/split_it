import 'package:flutter/scheduler.dart';
import 'package:split_it/modules/login/pages/login_state.dart';
import 'package:split_it/modules/login/services/login_service.dart';

class LoginController {
  LoginState state = LoginStateInitial();

  final VoidCallback onUpdate;
  final LoginService service;
  Function(LoginState state)? onChange;

  LoginController({required this.onUpdate, required this.service});

  Future<void> googleSignIn() async {
    try {
      state = LoginStateLoading();
      update();

      final user = await service.googleSignIn();

      if (user == null) {
        throw Exception("User login aborted.");
      }

      state = LoginStateSuccess(user: user);
      update();
    } catch (error) {
      state = LoginStateFailure(message: error.toString());
      update();
    }
  }

  void update() {
    onUpdate();

    if (onChange != null) {
      onChange!(state);
    }
  }

  void listen(Function(LoginState state) onChange) {
    this.onChange = onChange;
  }
}
