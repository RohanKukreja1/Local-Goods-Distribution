import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_1/Counters/cartItem.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/calling/assistant.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:provider/provider.dart';

import 'cartpage.dart';

class ItemsDetails extends StatefulWidget {
  final Menus? model;
  ItemsDetails({
    this.model
});

  @override
  _ItemsDetailsState createState() => _ItemsDetailsState();
}

class _ItemsDetailsState extends State<ItemsDetails> {
  TextEditingController counterTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery
            .of(context)
            .size
            .height;
    return Scaffold(
      appBar:AppBar (
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
          ("Good Luck Traders"),

        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.shopping_cart,color: Colors.red,size: 35.0,),
                  onPressed: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)
                  =>CartPage()));
                  }
              ),
              Positioned(
                child: Stack(
                  children: [
                    Icon(Icons.brightness_1,
                      size: 20.0,
                      color: Colors.green,),
                    Positioned(
                        top: 3,
                        right: 4,

                        child: Consumer<CartItemCounter>(
                            builder: (context, counter,c){
                              return Text(
                                counter.count.toString(),
                                style: TextStyle(
                                    color: Colors.white,fontSize: 12.0,
                                    ),

                              );
                            }
                        )
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      body:SingleChildScrollView(
          child:
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(widget.model!.thumbnailUrl.toString(),height: 360,
            width: 360,),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: NumberInputPrefabbed.roundedButtons(
              controller: counterTextEditingController,
              incDecBgColor: Colors.grey,
              min: 1,
              max: 30,
              initialValue: 1,
              buttonArrangement:ButtonArrangement.incRightDecLeft,

            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
                widget.model!.title.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.shortInfo.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.model!.description.toString(),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Rs: "
              +widget.model!.price.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
            SizedBox(height: 10.0,),
          Center(
            child: InkWell(
              onTap: (){
                int itemCounter = int.parse(counterTextEditingController.text);
                //check if item is exist already in cart
                List<String> separateItemIdList = separateItemId();

                separateItemIdList.contains(widget.model!.menuID)?
                    Fluttertoast.showToast(msg: "Item is already in Cart")
                :
                    //add item to cart

                addItemToCart(widget.model!.menuID,context,itemCounter);

              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: new LinearGradient(
                    colors: [Colors.black, Colors.blueGrey],
                    begin: FractionalOffset(0.0,0.0),
                    end : FractionalOffset(1.0,0.0),
                    stops: [0.0,1.0],
                    tileMode: TileMode.clamp,
                  ),
                ),
                width: MediaQuery.of(context).size.width -13,
                height: 50,
                child: Center(
                  child: Text("Add to Cart",
                  style: TextStyle(
                    color: Colors.white,fontSize: 16,
                  ),),
                ),
              ),
            ),
          ),

        ],
      ),
      ),
    );
  }
}
