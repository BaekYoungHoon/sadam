import 'package:firebase_auth/firebase_auth.dart';

void getCurrentUserUid(String uid) {
  User? user = FirebaseAuth.instance.currentUser;
  if (user != null) {
    uid = user.uid;
    print('Current user UID: $uid');
  } else {
    print('No user currently logged in.');
  }
}
