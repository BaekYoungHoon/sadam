import 'package:flutter/material.dart';

class AccidentDetailP with ChangeNotifier{
  String? name;
  String? id;
  String? sponsor;
  String? sponsorId;
  String? accidentType;
  String? insuranceCoverageType;
  String? accidentDescription;

  List<String> comment = [];
  List<Widget> widgets = [];

  void addWidget(Widget widget) {
    widgets.add(widget);
    notifyListeners(); // 변경 알림
  }

}