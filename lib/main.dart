
import 'package:flutter/material.dart';
import 'package:sadam/provider/accidentList.dart';
import 'package:sadam/provider/accident_detail.dart';
import 'package:sadam/provider/cloud_message1.dart';
import 'package:sadam/view/login.dart';
import 'package:provider/provider.dart';
import 'package:sadam/provider/ex.dart';
import 'package:sadam/provider/expansion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';
import 'package:sadam/login/social_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sadam/view/home.dart';
import 'package:sadam/view/login.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/provider/reple_list.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart' as kakaoAuth;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  kakaoAuth.KakaoSdk.init(nativeAppKey: '406c39ba829f927c8dccf7794ee8a89e'); // 이 줄을 runApp 위에 추가한다.
  final fcmToken = await FirebaseMessaging.instance.getToken();
  fcmToken;
  print("fcm토큰값 : $fcmToken");
  FirebaseMessaging.instance.onTokenRefresh
      .listen((fcmToken) {
    // TODO: If necessary send token to application server.

    // Note: This callback is fired at each app startup and whenever a new
    // token is generated.
  })
      .onError((err) {
    // Error getting token.
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => DropdownProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => ExpansionTileProvider(),
          ),
          ChangeNotifierProvider(
            create: (context) => AccidentDetailP(),
          ),
          ChangeNotifierProvider(
            create: (context) => GetAccidentData(),
          ),
          ChangeNotifierProvider(
            create: (context) => Reple(),
          ),
          ChangeNotifierProvider(
            create: (context) => messeage_1(),
          ),
        ],
      child: MaterialApp(
        home: CheckUserLoggedIn(),
      ),
    );
  }
}

class CheckUserLoggedIn extends StatelessWidget {
  Future<void> getSponsorId(String uid) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      // 'users' 컬렉션에서 'UserName' 필드가 userName 변수와 일치하는 도큐먼트를 찾습니다.
      DocumentSnapshot<Map<String, dynamic>> Snapshot = await firestore
          .collection('users')
          .doc(uid)
          .get();

      // 쿼리 결과에서 첫 번째 도큐먼트를 가져옵니다.
      if (Snapshot.exists) {
        var document = Snapshot.data()!['UserId'];
        useridController.text =  Snapshot.data()!['UserId']; // 'UserId' 필드 값을 반환합니다.
        userNameController.text = Snapshot.data()!['UserName'];
        sponsorController.text = Snapshot.data()!["SponsorName"];
        sponsorIdController.text = Snapshot.data()!["SponsorId"];

        print("이름 ${userNameController.text}");
        print("ID ${useridController.text}");
      } else {
        // 일치하는 도큐먼트가 없는 경우
        print("해당하는 UserName을 가진 사용자를 찾을 수 없습니다.");
      }
    } catch (e) {
      // 에러 처리
      print("Error getting user document: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    final messageProvider = Provider.of<messeage_1>(context);

    // 프로바이더를 초기화하고 메시지 수신을 시작
    messageProvider.init();
    return FutureBuilder(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            String uid = snapshot.data!.uid;
            String? name = snapshot.data!.displayName;
            uidController.text = uid;
            userNameController.text = name ?? "이름없음";
            print("uid : $uid");
            print("name : $name");
            print("uidController : ${uidController.text}");
            print("userNameController : ${userNameController.text}");
            getSponsorId(uidController.text);
            print(uid);
            return home();
          } else {
            return login();
          }
        }
      },
    );
  }
}

