import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fyp_1/Models/address.dart';
import 'package:fyp_1/ProductStore/home.dart';

class ShipmentAddressDesign extends StatelessWidget
{
  final Address? model;

  ShipmentAddressDesign({this.model});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text("Shipping Details:",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),),
        ),
        SizedBox(height: 6.0,),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 90.0,vertical: 5),
          width: MediaQuery.of(context).size.width,
          child: Table(
            children: [
              TableRow(
                children: [
                  Text(
                    "Name:",
                    style: TextStyle(color: Colors.black,fontSize: 16.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(model!.name!,
                    style: TextStyle(color: Colors.black,fontSize: 16.0,
                        fontWeight: FontWeight.bold),),
                ]
              ),


              TableRow(
                  children: [
                    Text(
                      "Contact:",
                      style: TextStyle(color: Colors.black,fontSize: 16.0,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(model!.phoneNumber!,
                      style: TextStyle(color: Colors.black,fontSize: 16.0,
                          fontWeight: FontWeight.bold),),
                  ]
              ),
            ],
          ),
        ),
        SizedBox(height: 20.0,),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            model!.fullAddress!,
            textAlign: TextAlign.justify,
            style: TextStyle(color: Colors.grey,fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        Center(
          child: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder:(context)
              =>storehome()));
            },
            child: Container(

            ),
          ),
        ),
      ],
    );
  }
}
