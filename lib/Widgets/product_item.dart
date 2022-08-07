import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Models/items.dart';

class ProductItem extends StatelessWidget {
  final Menus menu;

  const ProductItem({Key? key, required this.menu}) : super(key: key);
  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.all(10),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                Container(
                  height: 170,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image:AssetImage(menu.thumbnailUrl.toString()),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 15,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                      child: Icon(Icons.favorite,color: Colors.red,size: 15,)
                  ),),
              ],
            ),
            Text(menu.title.toString(),
            style: TextStyle(fontWeight: FontWeight.bold,height: 1.6),),
            Text(menu.price.toString(),
            style: TextStyle(fontWeight: FontWeight.bold,height: 1.6),),
          ],
        ),
      ),
    );
  }
}
