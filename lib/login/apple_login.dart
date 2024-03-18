import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAppleLogin {
  Future<void> loginWithApple() async {
    try {
      final AuthorizationCredentialAppleID appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      final oAuthProvider = OAuthProvider('apple.com');
      final credential = oAuthProvider.credential(
        idToken: appleIdCredential.identityToken,
        accessToken: appleIdCredential.authorizationCode,
      );
      appleIdCredential.userIdentifier;
      print(appleIdCredential.userIdentifier);
      await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      print(e);
    }
  }
}