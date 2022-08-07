import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class BottomNavBar extends StatefulWidget {
  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int pageIndex = 0;

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
        activeColor: Colors.red,
        inactiveColor: Colors.white,
        backgroundColor: Colors.black,

      items: [
        BottomNavigationBarItem(

            icon: Icon(
          Icons.home,size: 30,
        ),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(
          Icons.rss_feed,size: 30,
        ),label: 'Feed'),
        BottomNavigationBarItem(icon: Icon(
          Icons.search,size: 30,
        ),label: 'Search'),
        BottomNavigationBarItem(icon: Icon(
          Icons.shopping_bag,size: 30,
        ),label: 'Cart'),


      ],
      ),
    );
  }
}
