import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleLogin {
  Future<void> loginWithApple() async {
    try {
      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      print(appleIdCredential);
    } catch (e) {
      print(e);
    }
  }
}