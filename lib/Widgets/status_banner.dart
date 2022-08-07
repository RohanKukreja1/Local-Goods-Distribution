import 'package:flutter/material.dart';
import 'package:fyp_1/ProductStore/home.dart';

class StatusBanner extends StatelessWidget {
  final bool? status;
  final String? orderStatus;

  StatusBanner({this.orderStatus,this.status});

  @override
  Widget build(BuildContext context) {
    String message;
    IconData iconData;

    status! ? iconData = Icons.done : iconData = Icons.cancel;
    status! ? message = "Successful" : message = "Unsuccessful";

    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: const FractionalOffset(0.0,0.0),
          end : const FractionalOffset(1.0, 0.0),
          stops: [0.0,1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)
              =>storehome()));
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.green,
              size: 30,
            ),
          ),
          SizedBox(width: 20.0,),
          Text(
            orderStatus == "ended" ? "Parcel Delivered $message"
                : "Order Placed $message",
            style: TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          SizedBox(width: 5,),
          CircleAvatar(
            radius: 12,
            backgroundColor: Colors.white,
            child: Center(
              child: Icon(
                iconData,
                color: Colors.green,
                size: 25,
              ),
            ),
          )
        ],
      ),
    );
  }
}
