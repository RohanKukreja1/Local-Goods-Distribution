import 'package:flutter/material.dart';
import 'package:fyp_1/Address/addaddress.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/ProductStore/cartpage.dart';
import 'package:fyp_1/ProductStore/home.dart';
import 'package:fyp_1/Orders/myorders.dart';
import 'package:fyp_1/ProductStore/search.dart';
import 'package:fyp_1/config/config.dart';
import 'package:fyp_1/screens/Address_Screen.dart';
import 'package:fyp_1/screens/Hom.dart';
import 'package:fyp_1/screens/categories.dart';
import 'package:fyp_1/screens/company%20_intro.dart';
import 'package:fyp_1/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(

        children: [
          Container(
            padding: EdgeInsets.only(top: 25.0,bottom: 10.0),

            child: Column(
              children: [
               Material(
                  borderRadius:BorderRadius.all(Radius.circular(80.0)),
                  elevation: 8.0,
                  child: Container(
                    height: 160.0,
                    width: 160.0,
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                        sharedPreferences!.getString("photourl")!,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.0,),
                Text(
                  sharedPreferences!.getString("name",)!,
                  style: TextStyle(
                    color: Colors.black,fontSize: 25.0,fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
      ),
          SizedBox(height: 12.0,),
          Container(
           padding: EdgeInsets.only(top: 1.0),
            child: Column(
              children: [
                Divider(
                  height: 10,
                  color: Colors.black,
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(Icons.home,color: Colors.black,),
                  title: Text("Home",style: TextStyle(
                  color: Colors.black,
                  ),),

                  onTap: (){Navigator.push(context, MaterialPageRoute
                    (builder:(c)
                      =>storehome()));
                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.reorder,color: Colors.black,),
                  title: Text("Ledger",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.push(context, MaterialPageRoute
                    (builder:(c)
                  =>MyOrders()));


                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.shopping_cart,color: Colors.black,),
                  title: Text("My Cart",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.push(context, MaterialPageRoute
                    (builder:(c)
                  =>CartPage()));


                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.search,color: Colors.black,),
                  title: Text("Search",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.push(context, MaterialPageRoute
                    (builder:(c)
                  =>SearchProduct()));


                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.add_location,color: Colors.black,),
                  title: Text("Address",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (c)=>AddressScreen(

                    //totalAmount : totalAmount.toDouble(),
                  ),
                  ),
                  );


                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.query_builder,color: Colors.black,),
                  title: Text("About us",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){
                    Navigator.push(context,MaterialPageRoute(builder: (c)
                    =>Aboutus(

                      //totalAmount : totalAmount.toDouble(),
                    ),
                    ),
                    );


                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.exit_to_app,color: Colors.black,),
                  title: Text("Logout",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)
                  =>categories_screen()));




                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,)
                /*ListTile(
                  leading: Icon(Icons.exit_to_app,color: Colors.black,),
                  title: Text("hom",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){

                    //Navigator.of(context).pushReplacement(MaterialPageRoute
                    //(builder:(_)
                  //=>hom()));




                  },
                ),*/
                //Divider(height: 10.0,color: Colors.black,thickness: 2.0,),

              ],
            ),
          ),
        ],

      ),
    );
  }
}