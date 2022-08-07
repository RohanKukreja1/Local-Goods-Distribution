import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/config/config.dart';
class CategeoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical:25),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('WishList',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),),
          Row(
            children: [
              Text('View All',style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),),
              SizedBox(width: 10,),
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(Icons.arrow_forward_ios,color: Colors.white,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
