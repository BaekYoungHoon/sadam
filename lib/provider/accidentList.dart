import 'package:flutter/material.dart';
import 'package:sadam/controller/controller.dart';
import 'package:sadam/data/get_accident.dart';

class GetAccidentData with ChangeNotifier{
  GetAccident accident = GetAccident();
  List<String> accidentList = [];
  List<List<dynamic>> accidentDetailList = [];

  String detailQuestion = "";
  String detailDate = "";
  String detailSite = "";
  String detailCoverage = "";
  String detailAccidentType = "";
  String detailDescription = "";

  List<String> get accidentListP => accidentList;

  Future<void> fetchAccidentList(String uid) async {
    accidentList = await accident.getAccientList(uid);
    print(accidentList);
    print(accidentList.length);
    notifyListeners();
  }

  Future<void> fetchAccidentDetail(String uid) async{
    accidentDetailList = await accident.getAccidentDetail(uid);
    print(accidentDetailList);
    print(accidentDetailList.length);
    notifyListeners();
    //배열에 담긴 내용 순서
    //상담질문, 날짜, 지역, 보험종류, 사고종류, 사고내용
  }

  void setDetail(int num){
    detailAccidentType = detailAccidentTypeController.text;
    detailCoverage = detailCoverageController.text;
    detailDate = detailDateController.text;
    detailDescription = detailDescriptionController.text;
    detailQuestion = detailQuestionController.text;
    detailSite = detailSiteController.text;
    notifyListeners();
  }
}