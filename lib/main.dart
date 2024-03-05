import 'package:flutter/material.dart';
import 'package:sadam/provider/accident_detail.dart';
import 'package:sadam/view/login.dart';
import 'package:provider/provider.dart';
import 'package:sadam/provider/ex.dart';
import 'package:sadam/provider/expansion.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:sadam/login/social_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sadam/view/home.dart';
import 'package:sadam/view/login.dart';
import 'package:sadam/controller/controller.dart';

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
          )
        ],
      child: MaterialApp(
        home: CheckUserLoggedIn(),
      ),
    );
  }
}

class CheckUserLoggedIn extends StatelessWidget {
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
            return home();
          } else {
            return login();
          }
        }
      },
    );
  }
}

