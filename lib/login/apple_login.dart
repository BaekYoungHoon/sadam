import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sadam/view/add_sponser.dart';
import 'package:sadam/controller/controller.dart';
import 'package:flutter/material.dart';

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

  Future<void> AppleLogin(BuildContext context) async{
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oAuthProvider = OAuthProvider('apple.com');
    final credential = oAuthProvider.credential(
      idToken: appleCredential.identityToken,
      accessToken: appleCredential.authorizationCode,
    );

    // Firebase에 사용자 로그인
    await FirebaseAuth.instance.signInWithCredential(credential);

    uidController.text = await FirebaseAuth.instance.currentUser?.uid.toString() ?? "";


    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => Sponser()));
    // 로그인 성공 후 처리
    print('Apple 로그인 성공: ${FirebaseAuth.instance.currentUser?.uid}');
  }
}