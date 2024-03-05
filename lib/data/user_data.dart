import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore db = FirebaseFirestore.instance;

Widget UserData(String t, String field, BuildContext context){
  Size size = MediaQuery.of(context).size;
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 20,),
      Text(
        t,
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16
        ),
      ),
      SizedBox(height: 10,),
      Container(
        width: size.width*0.426,
        height: 50,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffe4e4e4)
        ),
        child: Center(
          child: Text(
            field,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400
            ),
          ),
        ),
      )
    ],
  );
}

class addUser {
  String? userName;
  String? userId;
  String? sponsorName;
  String? sponsorId;
  String? phoneNumber;
  String? acountNumber;
  String? loginType;


  final FirebaseFirestore db = FirebaseFirestore.instance;


  addUser({required this.userName, required this.loginType});

  void addUsers(String? uid) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').get();


    db.collection('users').doc(uid).set({
      'UserName': userName ?? "",
      'UserId': userId ?? "",
      'SponorName': sponsorName ?? "",
      'SponsorId': sponsorId ?? "",
      'PhoneNumber': phoneNumber ?? "",
      'AccountNumber': acountNumber ?? "",
      'LoginType' : loginType ?? ""
    });
  }

  void UpdateUsers() async{
    db.collection("collectionPath");
  }
}