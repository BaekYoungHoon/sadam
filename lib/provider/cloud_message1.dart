import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class messeage_1 with ChangeNotifier {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  String? _message = '';

  String? get message => _message;

  void setMessage(String? message) {
    _message = message;
    notifyListeners();
  }

  void init() async{
    _firebaseMessaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setMessage(message.notification?.body);
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      setMessage(message.notification?.body);
    });
    String? a = await _firebaseMessaging.getToken();
    print("fcm토큰값 : $a 까지");
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }


}