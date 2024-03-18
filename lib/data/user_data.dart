import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/data/get_memberid.dart';
import 'package:sadam/view/accountNumber.dart';
import 'package:sadam/data/get_currentuser.dart';

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

class UsersData {
  String? userName;
  String? userId;
  String? sponsorName;
  String? sponsorId;
  String? phoneNumber;
  String? acountNumber;
  String? loginType;


  final FirebaseFirestore db = FirebaseFirestore.instance;


  UsersData({required this.userName, required this.loginType});
  // UsersData.namedConstructor();

  void addUsers(String? uid) async {
    final querySnapshot = await FirebaseFirestore.instance.collection('users').get();


    await db.collection('users').doc(uid).set({
      'UserName': userName ?? "",
      'UserId': await addMember(uid),
      'SponsorName': sponsorName ?? "",
      'SponsorId': sponsorId ?? "",
      'PhoneNumber': phoneNumber ?? "",
      'AccountNumber': acountNumber ?? "",
      'LoginType' : loginType ?? "",
      "Bank" : "",
      "BankOwner" : ""
    });
  }
  
  void addSponsor(String? uid) async{
    db.collection("users").doc(uid).update({
      "SponsorName" : sponsorController.text,
      "SponsorId" : await getSponsorId(sponsorController.text)
    });
  }

  void AccountUpdate(String? uid) async{
    db.collection("users").doc(uid).update({
      "Bank" : bankNameController.text,
      "BankOwner" : accountOwnerController.text,
      "AccountNumber" : accountController.text,
      "PhoneNumber" : phoneNumberController.text,
    });
  }
}

