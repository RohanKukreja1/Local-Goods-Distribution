import 'package:flutter/material.dart';


class SimpleAppBar extends StatelessWidget with PreferredSizeWidget
{
   String? title;
   final PreferredSizeWidget? bottom;

   SimpleAppBar({this.bottom,this.title});

   @override
   Size get preferredSize =>  bottom==null? Size(56,AppBar().preferredSize
       .height):Size(56,80+AppBar().preferredSize.height);

  @override
  Widget build(BuildContext context) {
    return AppBar(

          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                colors: [Colors.black, Colors.blueGrey],
                begin: const FractionalOffset(0.0,0.0),
                end : const FractionalOffset(1.0, 0.0),
                stops: [0.0,1.0],
                tileMode: TileMode.clamp,
              ),
            ),
          ),
          title: Text(
            (title!),

          ),
          centerTitle: true,

    );
  }
}
