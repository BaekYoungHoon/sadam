import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sadam/data/colors.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/data/reple.dart';

class Reple with ChangeNotifier{
  RepleData rd = RepleData();
  List<String> repleText = [];
  //Future<List<String>> document = rd.getDocument(uidController.text);

  void addReple(String description) async{
    Future<List<String>> document = rd.getDocument(uidController.text);
    repleText.add(description);
    List<String> a = await document;
    await rd.setReple(uidController.text, description, Timestamp.now(), a[1]);
    notifyListeners();
  }

  void setReple(int index, String description) async{
    Future<List<String>> document = rd.getDocument(uidController.text);
    List<String> a = await document;

    await rd.setReple(uidController.text, description, Timestamp.now(), a[index]);

    repleText = await rd.getReple(uidController.text, a[index]);
    notifyListeners();
  }

  void getReple(int index) async{
    Future<List<String>> document = rd.getDocument(uidController.text);
    List<String> a = await document;

    repleText = await rd.getReple(uidController.text, a[index]);
    notifyListeners();
  }

  Widget repleList(String name, String description, BuildContext context){
    Size size = MediaQuery.of(context).size;
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: repleText.length,
      itemBuilder: (context, index) => ListTile(
          title: Container(
            // decoration: BoxDecoration(
            //   border: Border.all(
            //     color: Colors.black
            //   )
            // ),
            width: size.width*0.893,
            child: Column(
              children: [
                // SizedBox(height: 10,),
                Container(
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: mainGray
                            ),
                            width: size.width*0.16,
                            height: size.height*0.074,
                          ),
                          Text(
                              name
                          ),
                        ],
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                              repleText[index]
                          ),
                        ),
                        height: 85,
                        width: size.width*0.52,//원래 0.68이었음
                        margin: EdgeInsets.only(left: 20),
                        alignment: Alignment.topLeft,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: mainGray
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
      )
    );
  }

}
