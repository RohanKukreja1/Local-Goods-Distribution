
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Counters/cartItem.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/ProductStore/cartpage.dart';
import 'package:fyp_1/Widgets/items_design.dart';
import 'package:fyp_1/Widgets/loadingwidget.dart';
import 'package:fyp_1/Widgets/tag_list.dart';
import 'package:provider/provider.dart';
import 'package:fyp_1/Widgets/drawer.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';


class storehome extends StatefulWidget {


  @override
  _storehomeState createState() => _storehomeState();
}

class _storehomeState extends State<storehome> {
  final items =[
         "assets/images/oil.jpg",
         "assets/images/ghee.jpg",
         "assets/images/rice.jpg",
         "assets/images/sugar.jpg",
         "assets/images/tea.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar:AppBar (
            iconTheme: IconThemeData(color: Colors.black,size: 26),
            flexibleSpace: Container(
              color: Colors.white,
            ),

            title: Text(
              ("Good Luck Traders"),

            ),
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),

            centerTitle: true,
            actions: [
              Stack(
                children: [
                  IconButton(
                    icon: Icon(Icons.shopping_cart,color: Colors.black,size:
                    35.0,),
                    onPressed: (){
                      Navigator.push(context,MaterialPageRoute
                        (builder:(c)
                    =>CartPage()));
                    },
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
                                 style: const TextStyle(
                                   color: Colors.white,fontSize: 12,
                                    ),

                               );
                             }
                          )
                        ),

                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
          drawer: MyDrawer(

          ),
          body: CustomScrollView(

           slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Container(
                    decoration: BoxDecoration(
                    gradient: new LinearGradient(
                      colors: [Colors.white, Colors.white],
                      begin: FractionalOffset(0.0,0.0),
                      end : FractionalOffset(1.0,0.0),
                      stops: [0.0,1.0],
                      tileMode: TileMode.clamp,
                    ),
                    ),
                    height: MediaQuery.of(context).size.height*.3,
                    width: MediaQuery.of(context).size.width*.3,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height*.3,
                        aspectRatio: 16/9,
                        viewportFraction: 0.8,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 6),
                        autoPlayAnimationDuration: Duration(milliseconds: 1500),
                        autoPlayCurve: Curves.decelerate,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                      ),
                      items: items.map((index) {
                        return Builder(builder: (BuildContext context){
                          return Container(
                            width:MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal:1.0),
                            decoration: BoxDecoration(
                              color: Colors.black,
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Image.asset(index,
                              fit: BoxFit.fill,
                              ),
                            ),

                          );
                        });
                      }).toList()
                    ),
                  ),
                ),
              ),

              StreamBuilder<QuerySnapshot>(
              stream:FirebaseFirestore.instance.collection("users").doc
                ("product").collection("menus")
                  .snapshots(),
                builder: (context, snapshot){
                return !snapshot.hasData ? SliverToBoxAdapter(
                  child: Center(
                    child: circularProgress(),
                  ),)
                    : SliverStaggeredGrid.countBuilder(
                  crossAxisCount: 1,
                  staggeredTileBuilder: (c) =>StaggeredTile.fit(1),
                  itemBuilder: (context, index)
                  {
                    Menus sModel = Menus.fromJson(
                      snapshot.data!.docs[index].data()! as Map<String,dynamic>
                    );
                    return itemsDesign(model:sModel,context: context);
                  },
                  itemCount : snapshot.data!.docs.length,
                     );
                },
              ),

            ],
          ),



    );
  }
}
/*Widget sourceInfo(ItemModel model, BuildContext context,
    {required Color background, removeCartFunction}) {
  return*/
