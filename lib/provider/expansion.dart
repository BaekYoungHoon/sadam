import 'package:flutter/material.dart';

class ExpansionTileProvider with ChangeNotifier{
  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void setExpanded(bool value){
    _isExpanded = value;
    notifyListeners();
  }
}