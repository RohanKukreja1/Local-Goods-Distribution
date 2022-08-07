import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_1/Counters/cartItem.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/ProductStore/home.dart';
import 'package:fyp_1/screens/splash_screen.dart';
import 'package:provider/provider.dart';

separateOrdersItemId(orderIDs)
{
  List<String> separateItemIdList=[], defaultItemList=[];
  int i = 0;

  defaultItemList = List<String>.from(orderIDs);

  for(i; i<defaultItemList.length; i++)
  {
    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":"); //2314235:6
    //
    String getItemId = (pos != -1) ? item.substring(0,pos):item;
    print("\nThis is itemId now =" +getItemId);

    separateItemIdList.add(getItemId);

  }
  print("\n This is Items List Now = ");
  print(separateItemIdList);

  return separateItemIdList;
}


separateItemId(){
  List<String> separateItemIdList=[], defaultItemList=[];
  int i = 0;

  defaultItemList = sharedPreferences!.getStringList("userCart")!;

  for(i; i<defaultItemList.length; i++)
  {
    String item = defaultItemList[i].toString();
    var pos = item.lastIndexOf(":"); //2314235:6
           //
    String getItemId = (pos != -1) ? item.substring(0,pos):item;
    print("\nThis is itemId now =" +getItemId);

    separateItemIdList.add(getItemId);

  }
  print("\n This is Items List Now = ");
  print(separateItemIdList);

  return separateItemIdList;
}



addItemToCart(String? foodItemId, BuildContext context, int itemCounter){
  List<String>?  tempList = sharedPreferences!.getStringList("userCart");
  tempList!.add(foodItemId! + ":$itemCounter");//3375847574:7


  FirebaseFirestore.instance.collection("users").doc(firebaseAuth
      .currentUser!.uid).update({
    "userCart": tempList,
  }).then((value) {
      Fluttertoast.showToast(msg: "Item Added Successfully");
      sharedPreferences!.setStringList("userCart",tempList);

      Provider.of<CartItemCounter>(context,listen: false).displayResult();
  });

}

separateOrderItemQuantity(orderIDs)
{
  List<String> separateItemQuantityList=[];
  List<String> defaultItemList=[];

  int i =1;
  defaultItemList  = List<String>.from(orderIDs);

  for(i; i<defaultItemList.length; i++)
  {

    String item = defaultItemList[i].toString();

    //:8

    List<String> ListItemCharacters = item.split(":").toList();

    var quantityNumber = int.parse(ListItemCharacters[1].toString());
    print("\nThis is Quantity Number now =" +quantityNumber.toString());

    separateItemQuantityList.add(quantityNumber.toString());

  }
  print("\n This is Quantity List Now = ");
  print(separateItemQuantityList);
  return separateItemQuantityList;
}



separateItemQuantity()
{
  List<int> separateItemQuantityList=[];
  List<String> defaultItemList=[];

  int i =1;
  defaultItemList  =  sharedPreferences!.getStringList("userCart")!;

   for(i; i<defaultItemList.length; i++)
    {

       String item = defaultItemList[i].toString();

      //:8

     List<String> ListItemCharacters = item.split(":").toList();

     var quantityNumber = int.parse(ListItemCharacters[1].toString());
     print("\nThis is Quantity Number now =" +quantityNumber.toString());

     separateItemQuantityList.add(quantityNumber);

    }
  print("\n This is Quantity List Now = ");
  print(separateItemQuantityList);
  return separateItemQuantityList;
}

clearCart(context){
   sharedPreferences!.setStringList("userCart", ['garbageValue']);

   List<String>? emptyList = sharedPreferences!.getStringList("userCart");
   FirebaseFirestore.instance.collection("users").doc(firebaseAuth
       .currentUser!.uid).update({"userCart":emptyList}).then((value){
     sharedPreferences!.setStringList("userCart",emptyList!);
     Provider.of<CartItemCounter>(context,listen: false).displayResult();
     Navigator.push(context, MaterialPageRoute(builder:(c)=> storehome()));

      Fluttertoast.showToast(msg: "Cart has been Empty.");

   });
}