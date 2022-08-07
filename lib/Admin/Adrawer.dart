import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Admin/admin_home.dart';
import 'package:fyp_1/Admin/orders.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/Orders/myorders.dart';
import 'package:fyp_1/screens/categories.dart';
import 'package:fyp_1/Admin/uploaditems.dart';
import 'package:fyp_1/screens/splash_screen.dart';


class ADrawer extends StatelessWidget {
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

                ),
                Container(child: Image.asset('assets/images/download.jpg'),),
                SizedBox(height: 10.0,),
                Text(
                  ("ADMIN"),
                  style: TextStyle(
                      color: Colors.black,fontSize: 20.0,fontWeight:
                  FontWeight.bold
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
                  leading: Icon(Icons.shop_two,color: Colors.black,),
                  title: Text("Update Product",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)
                  =>UploadPage()));
                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.list,color: Colors.black,),
                  title: Text("Product List",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)
                  =>AdminHome()));


                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.card_giftcard_outlined,color: Colors.black,),
                  title: Text("Orders",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)
                  =>Orders()));


                  },
                ),

                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),
                ListTile(
                  leading: Icon(Icons.exit_to_app,color: Colors.black,),
                  title: Text("Logout",style: TextStyle(
                    color: Colors.black,
                  ),),

                  onTap: (){Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_) =>SplashScreen()));


                  },
                ),
                Divider(height: 10.0,color: Colors.black,thickness: 2.0,),

              ],
            ),
          ),
        ],

      ),
    );
  }
}