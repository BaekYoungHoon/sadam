import 'package:flutter/material.dart';

class DropdownProvider with ChangeNotifier {
  String? selectedAccidentTypeS = null;
  String? selectedInsuranceCoverageTypeS = null;
  String? selectedAccidentSiteS = null;

  bool _isClickedType = false;
  bool _isClickedSite = false;

  bool get isClickedType => _isClickedType;
  bool get isClickedSite => _isClickedSite;

  String? get selectedAccidentType => selectedAccidentTypeS;
  String? get selectedInsuranceCoverageType => selectedInsuranceCoverageTypeS;
  String? get selectedAccidentSite => selectedAccidentSiteS;

  set isClickedType(bool isclick){
    _isClickedType = isclick;
    notifyListeners();
  }

  set isClickedSite(bool isclick){
    _isClickedSite = isclick;
    notifyListeners();
  }

  set selectedAccidentType(String? value){
    selectedAccidentTypeS = value;
    notifyListeners();
  }

  set selectedInsuranceCoverageType(String? value){
    selectedInsuranceCoverageTypeS = value;
    notifyListeners();
  }

  set selectedAccidentSite(String? value){
    selectedAccidentSiteS = value;
    notifyListeners();
  }
}