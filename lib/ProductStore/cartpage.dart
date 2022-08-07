import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Counters/cartItem.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/Widgets/cart_item_design.dart';
import 'package:fyp_1/Widgets/loadingwidget.dart';
import 'package:fyp_1/Widgets/textwidgetheader.dart';
import 'package:fyp_1/calling/assistant.dart';
import 'package:fyp_1/calling/total_amount.dart';
import 'package:fyp_1/screens/Address_Screen.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<int>? separateItemQuantityList;
  num totalAmount = 0;

  @override
  void initState() {

      super.initState();
      totalAmount = 0;
      Provider.of<TotalAmount>(context,listen: false).displayTotalAmount(0);
      separateItemQuantityList = separateItemQuantity();
  }

  @override
  Widget build(BuildContext context) {
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
        leading: IconButton(
          icon: Icon(
            Icons.clear_all,
          ),
          onPressed: (){
            clearCart(context);
          },
        ),
        title: Text(
          ("Good Luck Traders"),
          /*
              "Good Luck Traders",
              style: TextStyle(
                  fontSize: 20.0, color: Colors.white,fontFamily: ''
              ),*/
        ),
        centerTitle: true,
        automaticallyImplyLeading: true,
        actions: [
          Stack(
            children: [
              IconButton(
                  icon: Icon(Icons.shopping_cart,color: Colors.red,size: 35.0,),
                  onPressed: (){
                   // Navigator.of(context).pushReplacement(MaterialPageRoute
                    //(builder:(_)
                  //=>CartPage()));
                    print("Clicked");
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 10,),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              heroTag: 'Clear',
              label: Text(
                  "Clear Cart",style: TextStyle(fontSize: 14),
                  ),
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.clear_all),
              onPressed: (){
                clearCart(context);

              },
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: FloatingActionButton.extended(
              heroTag: 'Proceed',
              label: Text(
                  "Proceed",style: TextStyle(fontSize: 14),
              ),
              backgroundColor: Colors.cyan,
              icon: Icon(Icons.navigate_next),
              onPressed: (){
                Navigator.push(context,MaterialPageRoute(builder: (c)=>
                AddressScreen(
                  totalAmount : totalAmount.toDouble(),

                ),
                ),
                );
              },
            ),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: TextWidgetHeader(
              title: "Cart List"
            )

          ),
          SliverToBoxAdapter(
            child: Consumer2<TotalAmount, CartItemCounter> (builder:
            (context, amountProvider, cartProvider, c){
              return Padding(padding:
              EdgeInsets.all(8),
                child: Center(
                  child: cartProvider.count == 0 ? Container() : Text(
                    "Total Price: " + amountProvider.tAmount.toString(),
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              );
            }),

          ),

          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users").doc
              ("product").collection("menus").where("menuID",whereIn:
            separateItemId()).orderBy("publishedDate",descending: true)
                .snapshots(),
            builder: (context, snapshot){
              return !snapshot.hasData ? SliverToBoxAdapter(
                child: Center(
                  child: circularProgress(),
                ),
              )
                  : snapshot.data!.docs.length == 0
                  ? //buildingcart
                     Container()
                  : SliverList(
                     delegate: SliverChildBuilderDelegate(
                         (context,index){
                           Menus model = Menus.fromJson(snapshot.data!
                               .docs[index].data()! as Map<String,dynamic>,

                           );
                           if(index==0){
                             totalAmount = 0;
                             totalAmount = totalAmount + (model.price! *
                                 separateItemQuantityList![index]);
                           }
                           else{
                             totalAmount = totalAmount + (model.price! *
                                 separateItemQuantityList![index]);

                           }
                           if(snapshot.data!.docs.length - 1 == index){
                             WidgetsBinding.instance!.addPostFrameCallback((timeStamp)
                             {Provider.of<TotalAmount>(context,listen: false)
                                 .displayTotalAmount(totalAmount.toDouble());
                             });
                           }
                           return CartItemDesign(
                             model: model,
                             context: context,
                             qunatitynumber:
                             separateItemQuantityList![index],
                           );
                         },
                       childCount: snapshot.hasData ? snapshot.data!.docs
                           .length : 0,
                     ),

                     );
            },
          ) ,
        ],
      ),
    );
  }
}

