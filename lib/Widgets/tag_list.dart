

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class TagList extends StatelessWidget {

  final taglist=[
    'Cooking Oil',
    'Tea',
    'Rice',
    'Sugar',
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: taglist.map((e) => Container(
        margin: EdgeInsets.all(14),
        padding: EdgeInsets.all(10),
        child: Text(e,style: TextStyle(color: Colors.black,fontWeight:
        FontWeight.bold,
            ),),
      ),)
          .toList(

      ),
    );
  }
}
