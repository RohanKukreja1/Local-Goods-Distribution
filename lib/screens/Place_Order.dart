import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_1/DialogueBox/Placed%20Orded.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/ProductStore/home.dart';
import 'package:fyp_1/calling/assistant.dart';

class PlaceOrder extends StatefulWidget
{
  String? addressID;
  double? totalAmount;
  String? title;
  String? Qty;

  PlaceOrder({
    this.addressID,
    this.totalAmount,
    this.title,
    this.Qty,
});


  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder>
{
  String orderId = DateTime.now().millisecondsSinceEpoch.toString();
  addOrderDetails(){
    writeOrderDetails({
      "addressID":widget.addressID,
      "totalAmount":widget.totalAmount,
      "title":sharedPreferences!.getString("title"),
      "qty":sharedPreferences!.getString("qty"),
      "orderBy": sharedPreferences!.getString("uid"),
      "productIDs": sharedPreferences!.getStringList("userCart"),
      "paymentDetails":"Cash on Delivery",
      "orderTime": orderId,
      "isSuccess": true,
      "status": "normal",
      "orderId": orderId,

    }).whenComplete(() {
      clearCart(context);
      setState(() {
        orderId="";
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
        storehome()));
        //Fluttertoast.showToast(msg: "Order has been placed Successfully.");
        Navigator.pop(context);
        showDialog(
            context: context,
            builder: (c)
            {
              return ErrorAlertDialog(
                message: "Your Order has been Placed Successfully",
              );
            }
        );
      });
    });

  }

  Future writeOrderDetails(Map<String, dynamic> data) async{
    await FirebaseFirestore.instance.collection("users")
        .doc(sharedPreferences!.getString("uid"))
    .collection("orders").doc(orderId).set(data);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Thank You ",
              style: TextStyle(
                color: Colors.orange,
                fontSize: 40.0
              )
              ,),
            SizedBox(height: 40.0),
            Image.asset("assets/images/placeorder.png",height: 130,width: 130),

            SizedBox(height: 20.0),

            ElevatedButton(
              child: Text("Place Order"),
              style: ElevatedButton.styleFrom(
                primary: Colors.cyan,
              ),
              onPressed: (){
                addOrderDetails();

              },

            ) ,
            SizedBox(height: 40.0,),
        ElevatedButton(
          child: Text("Back To Home"),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute
              (builder:(c)
            =>storehome()));

          },
        ),


          ],
        ),
      ),
    );
  }
}
