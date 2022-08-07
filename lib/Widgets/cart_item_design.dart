import 'package:flutter/material.dart';
import 'package:fyp_1/Models/items.dart';

class CartItemDesign extends StatefulWidget {
  final Menus? model;
  BuildContext? context;
  final int? qunatitynumber;

  CartItemDesign({
   this.model,
   this.context,
   this.qunatitynumber,
});

  @override
  _CartItemDesignState createState() => _CartItemDesignState();
}

class _CartItemDesignState extends State<CartItemDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.cyan,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: [
              Image.network(widget.model!.thumbnailUrl!,width: 140, height: 120,),
              SizedBox(width: 6,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    widget.model!.title!,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 1,),
                  Row(
                    children: [
                      Text(
                        "Qty: ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        widget.qunatitynumber.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text("Price: ",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                      ),),
                      Text(
                        widget.model!.price.toString(),
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
