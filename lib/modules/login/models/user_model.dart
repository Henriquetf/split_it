import 'package:google_sign_in/google_sign_in.dart';

class UserModel {
  final String id;
  final String email;
  final String? name;
  final String? photoUrl;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.photoUrl,
  });

  factory UserModel.fromGoogleAccount(GoogleSignInAccount account) {
    return UserModel(
      id: account.id,
      name: account.displayName,
      email: account.email,
      photoUrl: account.photoUrl,
    );
  }
}
