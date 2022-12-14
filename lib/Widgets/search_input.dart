import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class SearchInput extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Flexible(
            flex: 1,
              child:TextField(

            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              hintText: "Search For Products",
              hintStyle: TextStyle(color: Colors.grey),
              prefixIcon:Container(
                padding: EdgeInsets.all(15),
                child: Text('🔍',style: TextStyle(fontSize: 25),)
              ),
            ),
          ),),
          Container(
            margin: EdgeInsets.only(left: 10),
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
              

            ),
              child: Image.asset('assets/images/filter.png',width: 25,)),
        ],
      ),
    );
  }
}
