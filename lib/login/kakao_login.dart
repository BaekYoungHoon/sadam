// import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
//
// class KakaoLogin {
//   static Future<void> loginWithKakao() async {
//     try {
//       final installed = await isKakaoTalkInstalled();
//       if (installed) {
//         final authCode = await AuthCodeClient.instance.requestWithTalk();
//         final token = await AuthApi.instance.issueAccessToken(authCode);
//         AccessTokenStore.instance.toStore(token);
//       } else {
//         final authCode = await AuthCodeClient.instance.request();
//         final token = await AuthApi.instance.issueAccessToken(authCode);
//         AccessTokenStore.instance.toStore(token);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }