import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sadam/controller/controller.dart';

class AccidentDetail {
  FirebaseFirestore db = FirebaseFirestore.instance;

  String uid = "";
  String? userName;
  String? userId;
  String? accidentType;
  String? coverageType;
  String? accidentSite;
  String? description;
  String? expertAnswer;
  bool isStatus = false;
  int? commission;
  List<String> reple = [];

  AccidentDetail() {{

  }
    getCurrentUserUid(uid);
  }

  void getCurrentUserUid(String uid) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      uid = user.uid;
      print('Current user UID: $uid');
    } else {
      print('No user currently logged in.');
    }
  }

  void getAccidentDetail(List<List<String>> list) async{

  }

  void addAccident(String Atype, String Ctype, String Stype,
       String description, String question)async{
    await db.collection("users").doc(uidController.text).collection("myAccident").doc().set({
      "accidentType" : Atype,
      "coverageType" : Ctype,
      "accidentSite" : Stype,
      "description"  : description,
      "question"     : question,
      "timeStamp"    : Timestamp.now()
    });
  }
}
