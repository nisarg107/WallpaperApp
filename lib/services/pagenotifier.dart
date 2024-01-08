import 'package:flutter/material.dart';

class PageNotifier extends ChangeNotifier{
  int _activePage=0;

  int get activePage=>_activePage;
  set pageIndex(int index){
    _activePage=index;
    notifyListeners();
  }
}