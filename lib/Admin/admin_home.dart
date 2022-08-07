import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fyp_1/Admin/Adrawer.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/Widgets/items_design.dart';
import 'package:fyp_1/Widgets/loadingwidget.dart';

import 'menus_item_design.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  _AdminHomeState createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black,size: 26),
        flexibleSpace: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: const FractionalOffset(0.0,0.0),
              end : const FractionalOffset(1.0, 0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            ),
          ),),
        title: Text(
          "Good Luck Traders",
          style: TextStyle(
              fontSize: 20.0, color: Colors.black,fontFamily: ''
          ),
        ),
        centerTitle: true,

      ),
      drawer: ADrawer(),

      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: ListTile(
              title: Text(
                "Product List",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.teal,
                ),
              ),
            )
          ),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection("users")
            .doc("product").collection("menus").snapshots(),
            builder: (context, snapshot){
              return !snapshot.hasData ? SliverToBoxAdapter(
                child: Center(
                  child: circularProgress(),
                ),
              ): SliverStaggeredGrid.countBuilder(
                crossAxisCount: 1,
                staggeredTileBuilder: (c)=>StaggeredTile.fit(1),
                itemBuilder: (context, index){
                  Menus model = Menus.fromJson(
                    snapshot.data!.docs[index].data()!
                        as Map<String,dynamic>,
                  );
                  return menusitemdesign(
                    model: model,
                    context: context,
                  );
                },
                itemCount: snapshot.data!.docs.length,
              );
            },
          )
        ],
      ),
    );
  }
}

