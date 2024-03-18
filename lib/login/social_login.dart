import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sadam/view/add_sponser.dart';
import 'package:sadam/view/home.dart';
import 'package:sadam/view/login.dart';
import 'package:sadam/data/user_data.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class GoogleLogin{
  final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  final FirebaseAuth _auth = FirebaseAuth.instance;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<Widget> checkLoginStatus(BuildContext context) async {
    bool isSignedIn = await _googleSignIn.isSignedIn();
    if (isSignedIn) {
      print('User is already signed in.');
      return home();
    } else {
      return login();
    }
  }
  Future<void> handleSignIn(BuildContext context) async {

    try {
      GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
        await account.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final UserCredential authResult = await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        UsersData users = UsersData(userName: user?.displayName, loginType: "구글");

        userNameController.text = user?.displayName.toString() ?? "";
        loginTypeController.text = "구글";
        users.addUsers(user?.uid);
        uidController.text = user?.uid ?? "";
        print("UID 컨트롤러 : ${uidController.text}");

        Navigator.of(context).pushReplacement(
            MaterialPageRoute(
                builder: (context) => Sponser()));

        print('Logged in: ${account.displayName}\n${account.authentication}\n${account.authHeaders}\n${account}');
      } else {
        // 로그인 실패
        print('Login failed.');
      }
    } catch (error) {
      print('Error while signing in: $error');
    }
  }

  Future<void> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      print('User signed out successfully.');
    } catch (error) {
      print('Error while signing out: $error');
    }
  }
}

// class AppleLogin{
//         final appleCredential = await SignInWithApple.getAppleIDCredential(
//           scopes: [
//             AppleIDAuthorizationScopes.email,
//             AppleIDAuthorizationScopes.fullName,
//           ],
//         );
//
//         final oAuthProvider = OAuthProvider('apple.com');
//         final credential = oAuthProvider.credential(
//           idToken: appleCredential.identityToken,
//           accessToken: appleCredential.authorizationCode,
//         );
//
//         // Firebase에 사용자 로그인
//         await FirebaseAuth.instance.signInWithCredential(credential);
//
//         // 로그인 성공 후 처리
//         print('Apple 로그인 성공: ${FirebaseAuth.instance.currentUser?.uid}');
// }