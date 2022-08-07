import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/ProductStore/home.dart';

class Aboutus extends StatelessWidget {
  const Aboutus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.black12, Colors.black12],
              begin: const FractionalOffset(0.0,0.0),
              end : const FractionalOffset(1.0, 0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: Text(
          ('About us'),
          style: TextStyle(color:Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Text(
            ' Good Luck Traders is one of the leading companies in the field '
                'of oil and ghee distribution in interior sindh. Currently we'
                ' have more than 600 active retailers and expect to have much '
                'more in the future. Mostly people living in interior Sindh use Shahbaz Ghee which is delivered by us to retailers and from retailers to local people. Besides Oil and Ghee, we also deliver Tea, Rice and Sugar.',
            style: TextStyle(
              color: Colors.teal,
              fontSize: 16,

            ),
          ),
        ),
      ),
    );
  }
}
