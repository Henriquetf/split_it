import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:split_it/modules/login/models/user_model.dart';
import 'package:split_it/modules/login/pages/login_controller.dart';
import 'package:split_it/modules/login/pages/login_state.dart';
import 'package:split_it/modules/login/services/login_service.dart';

class LoginServiceMock extends Mock implements LoginService {}

void main() {
  late LoginController controller;
  late LoginService service;

  setUp(() {
    service = LoginServiceMock();

    controller = LoginController(
      service: service,
      onUpdate: () {},
    );
  });

  test("Google Sign In returns success", () async {
    expect(controller.state, isInstanceOf<LoginStateInitial>());

    final states = <LoginState>[];

    controller.listen((state) {
      states.add(state);
    });

    when(service.googleSignIn).thenAnswer((_) async => UserModel(
          id: "id",
          name: "Test User",
          email: "test.user@example.com",
          photoUrl: "https://example.com/avatar.png",
        ));

    await controller.googleSignIn();

    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateSuccess>());
    expect(states.length, 2);
  });

  test("Google Sign In returns failure", () async {
    expect(controller.state, isInstanceOf<LoginStateInitial>());

    final states = <LoginState>[];

    controller.listen((state) {
      states.add(state);
    });

    when(service.googleSignIn).thenThrow("Login aborted");

    await controller.googleSignIn();

    expect(states[0], isInstanceOf<LoginStateLoading>());
    expect(states[1], isInstanceOf<LoginStateFailure>());
    expect(states.length, 2);
  });

  test("Controller update notifies listen method with the correct state", () async {
    controller.listen((state) => expect(state, isInstanceOf<LoginStateLoading>()));

    controller.state = LoginStateLoading();
    controller.update();
  });

  test("Controller update calls listen method", () async {
    var called = false;

    controller.listen((state) {
      called = true;
    });

    controller.state = LoginStateLoading();
    controller.update();

    expect(called, true);
  });
}
