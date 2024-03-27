import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/login/kakao_login.dart';
import 'package:sadam/view/add_sponser.dart';
import 'package:sadam/login/social_login.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sadam/login/apple_login.dart';

class login extends StatelessWidget {
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 169),
          Center(
            child: Icon(
                FontAwesomeIcons.bell,
              size: 200,
              color: mainRed,
            ),
            // child: Text(
            //   "로고",
            //   style: TextStyle(
            //     fontSize: 50,
            //     fontWeight: FontWeight.bold
            //   ),
            // ),
          ),
          SizedBox(
            height: 170,
          ),
          Column(
            children: [
              // button(
              //   Icon(
              //     FontAwesomeIcons.chalkboardTeacher,
              //     color: Color(0xffF2CB05),
              //   ),
              //   "카카오 로그인",
              //   Color(0xffF2CB05),
              //   context,
              //   Sponser()
              // ),
              SizedBox(
                  width: 335,
                  height: 50,
                  child: ButtonTheme(
                    minWidth: 335,//버튼의 최소 가로 길이
                    height: 50,//버튼의 세로 길이
                    shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Color(0xffF2CB05)
                        )
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        KakaoLogin k = KakaoLogin();
                        k.b(context);
                      },
                      child: Container(
                        width: 302,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Icon(
                            //   FontAwesomeIcons.chalkboardTeacher,
                            //   color: Color(0xffF2CB05),
                            // ),
                            Image.asset(
                              'assets/icon_kakao.png', // 이미지 아이콘 경로
                              width: 26, // 이미지의 너비 조절
                              height: 26, // 이미지의 높이 조절
                            ),
                            Text(
                              "카카오 로그인",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              ),
              SizedBox(height: 25),
              button(
                Icon(
                  FontAwesomeIcons.google,
                  color: Color(0xffBF4A3F),
                ),
                "구글 로그인",
                Color(0xffBF4A3F),
                context,
                Sponser()
              ),
              SizedBox(height: 25),
              // button(
              //   Icon(
              //     FontAwesomeIcons.apple,
              //     color: Color(0xff1E1E1E),
              //   ),
              //   "애플 로그인",
              //   Color(0xff1E1E1E),
              //   context,
              //   Sponser()
              // )
              SizedBox(
                  width: 335,
                  height: 50,
                  child: ButtonTheme(
                    minWidth: 335,//버튼의 최소 가로 길이
                    height: 50,//버튼의 세로 길이
                    shape: RoundedRectangleBorder( //버튼을 둥글게 처리
                        borderRadius: BorderRadius.circular(10),
                        side: BorderSide(
                            color: Color(0xff1E1E1E)
                        )
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        FirebaseAppleLogin a = FirebaseAppleLogin();
                        a.AppleLogin(context);
                      },
                      child: Container(
                        width: 302,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Icon(
                              FontAwesomeIcons.apple,
                              color: Color(0xff1E1E1E),
                            ),
                            Text(
                              "애플 로그인",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
              )
              // SignInWithAppleButton(
              //
              //   onPressed: () async {
              //     FirebaseAppleLogin a = FirebaseAppleLogin();
              //     // a.loginWithApple();
              //     final appleCredential = await SignInWithApple.getAppleIDCredential(
              //       scopes: [
              //         AppleIDAuthorizationScopes.email,
              //         AppleIDAuthorizationScopes.fullName,
              //       ],
              //     );
              //
              //     final oAuthProvider = OAuthProvider('apple.com');
              //     final credential = oAuthProvider.credential(
              //       idToken: appleCredential.identityToken,
              //       accessToken: appleCredential.authorizationCode,
              //     );
              //
              //     // Firebase에 사용자 로그인
              //     await FirebaseAuth.instance.signInWithCredential(credential);
              //
              //     uidController.text = await FirebaseAuth.instance.currentUser?.uid.toString() ?? "";
              //
              //
              //     Navigator.of(context).pushReplacement(
              //         MaterialPageRoute(
              //             builder: (context) => Sponser()));
              //     // 로그인 성공 후 처리
              //     print('Apple 로그인 성공: ${FirebaseAuth.instance.currentUser?.uid}');
              //   },
              // ),
            ],
          )
        ],
      ),
    );
  }
}

Widget button(Icon i, String t, Color c, BuildContext context, Widget widget){
  return SizedBox(
      width: 335,
      height: 50,
      child: ButtonTheme(
        minWidth: 335,//버튼의 최소 가로 길이
        height: 50,//버튼의 세로 길이
        shape: RoundedRectangleBorder( //버튼을 둥글게 처리
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(
                color: c
            )
        ),
        child: MaterialButton(
          onPressed: () {
            GoogleLogin g = GoogleLogin();
            g.handleSignIn(context);
            //g.checkLoginStatus(context);
            // Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(
            //         builder: (context) => widget));
          },
          child: Container(
            width: 302,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                i,
                Text(
                  t,
                  style: TextStyle(
                    fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ),
        ),
      )
  );
}