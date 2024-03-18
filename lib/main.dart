import 'package:flutter/material.dart';
import 'package:sadam/provider/accidentList.dart';
import 'package:sadam/provider/accident_detail.dart';
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

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return FutureBuilder(
      future: FirebaseAuth.instance.authStateChanges().first,
      builder: (context, AsyncSnapshot<User?> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else {
          if (snapshot.hasData) {
            String uid = snapshot.data!.uid;
            uidController.text = uid;
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

