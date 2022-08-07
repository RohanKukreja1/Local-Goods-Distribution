import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/ProductStore/items_details.dart';
import 'package:fyp_1/config/config.dart';

class menusitemdesign extends StatefulWidget {
  Menus? model;
  BuildContext? context;

  menusitemdesign({
    this.model,
    this.context
  });


  @override
  _itemsDesignState createState() => _itemsDesignState();
}

class _itemsDesignState extends State<menusitemdesign> {

  deleteMenu(String menuID){
    FirebaseFirestore.instance.collection("users").doc("product")
        .collection("menus").doc(menuID).delete();

    Fluttertoast.showToast(msg: "Product Deleted");
  }


  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: (){


      },
      splashColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Container(
          padding: EdgeInsets.all(10),
          height: 235,
          width: MediaQuery.of(context).size.width,
          child: Column (
            children: [
              Divider(
                height: 1,
                thickness: 2,
                color: Colors.black,
              ),
              SizedBox(height:8,),
              Image.network(
                widget.model!.thumbnailUrl!,
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.model!.title!,
                    style: TextStyle(color: Colors.black,
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.delete_sweep,
                      size: 30,
                      color: Colors.red,
                    ),
                    onPressed: (){
                      deleteMenu(widget.model!.menuID!);

                    },
                  )
                ],
              ),

              SizedBox(height: 2,),
              Text("Rs: "+
                  widget.model!.price.toString()+"/=",
                style: TextStyle(color: Colors.black,
                    fontSize: 22,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
              ),



            ],
          ),
        ),
      ),

    );
  }
}
