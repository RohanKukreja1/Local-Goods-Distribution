import 'package:flutter/material.dart';

class ItemQuantity with ChangeNotifier{
  int _numberofItems = 0;
  int get numberofItems =>  _numberofItems;

  display(int num){
    _numberofItems = num;
    notifyListeners();
  }
}