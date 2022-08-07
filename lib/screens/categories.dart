
import 'package:flutter/material.dart';
import 'package:fyp_1/product.dart';
import 'package:fyp_1/screens/login_screen.dart';
import 'package:fyp_1/screens/register.dart';
class categories_screen extends StatefulWidget {
  static const String id ='category_screen';

  @override
  _categories_screenState createState() => _categories_screenState();
}

class _categories_screenState extends State<categories_screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,

      child: Scaffold(

        appBar: AppBar(
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [Colors.white, Colors.white],
                  begin: const FractionalOffset(0.0,0.0),
                  end : const FractionalOffset(1.0, 0.0),
                  stops: [0.0,1.0],
                  tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: Text(
            "Good Luck Traders",
            style: TextStyle(
              fontSize: 20.0, color: Colors.black,fontFamily: ''
            ),
          ),
            centerTitle: true,
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.lock, color: Colors.black,size: 32.0,),
                  child:
                  Text(
                    "Login",style: TextStyle(color: Colors.black),
                  ),
                ),
                Tab(
                  icon: Icon(Icons.perm_contact_calendar, color: Colors
                      .black,size: 32.0,),
                  child:
                  Text(
                    "Register",style: TextStyle(color: Colors.black,),
                  ),

                ),
              ],
              indicatorColor: Colors.grey,
              indicatorWeight: 5.0,
            ),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: new LinearGradient(
            colors: [Colors.white, Colors.white],
            begin: Alignment.topRight,
            end : Alignment.bottomLeft,
          ),
        ),
          child: TabBarView(
            children: [
              Login_Screen(),
              Registration_Screen(),
            ],
          ),
      ),
      ),
    );
  }}


