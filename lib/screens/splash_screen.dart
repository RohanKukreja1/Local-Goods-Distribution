import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/config/config.dart';
import 'package:fyp_1/screens/login_screen.dart';
import 'package:fyp_1/screens/categories.dart';
class SplashScreen extends StatefulWidget {


  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds:3),(){

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)
      =>categories_screen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/download.jpg',
            height: 320,
            ),
            SizedBox(height: 20 ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.purple),

            )
          ],
        ),
      ),
    );
  }
}
