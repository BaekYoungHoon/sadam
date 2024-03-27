import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakaoAuth;
import 'package:sadam/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:sadam/data/user_data.dart';
import 'package:sadam/view/add_sponser.dart';

class KakaoLogin {
  Future<void> b(BuildContext context) async {
    var provider = OAuthProvider("oidc.claimassistant");

    kakaoAuth.OAuthToken token = await kakaoAuth.UserApi.instance.loginWithKakaoAccount();
    final AuthCredential credential = provider.credential(
      idToken: token.idToken,
      accessToken: token.accessToken
    );
    final FirebaseAuth auth = FirebaseAuth.instance;
    final UserCredential a = await auth.signInWithCredential(credential);
    final User? user = a.user;

    UsersData users = UsersData(userName: user?.displayName, loginType: "카카오");

    userNameController.text = user?.displayName.toString() ?? "";
    loginTypeController.text = "구글";
    users.addUsers(user?.uid);
    uidController.text = user?.uid ?? "";
    print("UID 컨트롤러 : ${uidController.text}");

    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (context) => Sponser()));
  }
}