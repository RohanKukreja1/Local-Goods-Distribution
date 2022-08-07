import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Screenss/Cart.dart';
import 'package:fyp_1/Screenss/Feeds.dart';
import 'package:fyp_1/Screenss/Homee.dart';
import 'package:fyp_1/Screenss/Profile.dart';
import 'package:fyp_1/Screenss/Search.dart';
import 'package:fyp_1/Widgets/customappbar.dart';

class hom extends StatefulWidget {

  @override
  State<hom> createState() => _homState();
}

class _homState extends State<hom> {
  int pageIndex=0;

  List pages = [
    HomeScrenn(),
    Feed_Screen(),
    Search_Screen(),
    Cart_Screen(),
    Profile_Screen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CupertinoTabBar(
        onTap: (index){
          setState(() {
            pageIndex=index;
          });

        },
        currentIndex: pageIndex,
        activeColor: Colors.green,
        inactiveColor: Colors.white,
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(icon:Icon(
            Icons.home,size: 30,),label:'Home'),
          BottomNavigationBarItem(icon:Icon(
            Icons.rss_feed,size: 30,),label:'Feed'),
          BottomNavigationBarItem(icon:Icon(
            Icons.search,size: 30,),label:'Search'),
          BottomNavigationBarItem(icon:Icon(
            Icons.shopping_bag,size: 30,),label:'Cart'),
          BottomNavigationBarItem(icon:Icon(
            Icons.person,size: 30,),label:'Profile'),
        ],
      ),
      body: pages[pageIndex],
    );
  }
}
