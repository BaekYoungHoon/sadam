import 'package:flutter/material.dart';
import 'package:sadam/widget/button.dart';
class navi{
  var context;
  var moveWidget;
  navi({required this.context, required this.moveWidget});
  void changeView(){
    Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => moveWidget));
  }
  void viewPop(){
    Navigator.of(context).pop();
  }
}