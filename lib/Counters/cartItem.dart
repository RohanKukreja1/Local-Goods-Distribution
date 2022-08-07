import 'package:flutter/material.dart';
import 'package:fyp_1/Global/global.dart';

class CartItemCounter extends ChangeNotifier{


  int cartListItemCounter = sharedPreferences!.getStringList("userCart")!
      .length - 1;
  int get count => cartListItemCounter;

  Future<void> displayResult()async{
    cartListItemCounter = sharedPreferences!.getStringList("userCart")!
        .length - 1;

    await Future.delayed(const Duration(microseconds: 100),(){
      notifyListeners();
    });
  }
}