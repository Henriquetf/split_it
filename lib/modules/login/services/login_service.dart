import 'package:google_sign_in/google_sign_in.dart';
import 'package:split_it/modules/login/models/user_model.dart';

abstract class LoginService {
  Future<UserModel?> googleSignIn();
}

class GoogleLoginService implements LoginService {
  GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );

  @override
  Future<UserModel?> googleSignIn() async {
    final account = await _googleSignIn.signIn();

    if (account == null) {
      return null;
    }

    return UserModel.fromGoogleAccount(account);
  }
}
