// import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AddAccident{
  final db = FirebaseFirestore.instance;

  String? userName;
  String? userId;
  String? accidentType;
  String? coverageType;
  String? accidentSite;
  String? description;
  String? question;

  AddAccident({required this.userName, required this.userId, required this.accidentType,
  required this.coverageType, required this.accidentSite, required this. description, required this.question});

  void addTest(){
    print("$userName, $userId, $accidentType, $coverageType, $accidentSite, $description, $question, ${Timestamp.now().toDate().toString().substring(0, 16)}");
  }

  void addAccident() async{
    db.collection("users").doc().collection("accident").doc("${Timestamp.now().toDate().toString()}").set({
      "userName"     : userName,
      "userId"       : userId,
      "accidentType" : accidentType,
      "coverageType" : coverageType,
      "accidentSite" : accidentSite,
      "description"  : description,
      "question"     : question,
      "addDate"      : Timestamp.now(),
    });
  }
}