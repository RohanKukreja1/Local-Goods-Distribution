import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomappBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:30,left: 30,right: 25,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(text: TextSpan(
            children: [
              TextSpan(
                text: 'Hello,What Are You\nLooking For?,',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(text: '👀',style: TextStyle(fontSize: 35)),
            ],
          ),),
          Stack(children:[
            Container(
             padding:EdgeInsets.all(10),
             decoration: BoxDecoration(
             color: Colors.white,
               borderRadius: BorderRadius.circular(10),
               boxShadow: [
                 BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 0.1,
                  blurRadius: 0.1,
                  offset: Offset(0,1),
                      ),
                      ],
             ),

              child: Icon(
             Icons.shopping_cart_outlined,
              color: Colors.grey,),),
                Positioned(right:10,left: 10,

                 child:Container(
                 height: 10,
                 width: 10,
                 decoration: BoxDecoration(
                 color: Colors.black,
                 shape: BoxShape.circle,


                                   ),
                              ),

                               ),
                          ],),
                        ],
                      ),
                    );
                  }
                }
