import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/Widgets/loadingwidget.dart';
import 'package:fyp_1/Widgets/order_card.dart';
import 'package:fyp_1/Widgets/simpleAppBar.dart';
import 'package:fyp_1/calling/assistant.dart';
class MyOrders extends StatefulWidget {
  @override
  _MyOrdersState createState() => _MyOrdersState();
}



class _MyOrdersState extends State<MyOrders> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SimpleAppBar(title: "Ledger",),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection("users")
          .doc(sharedPreferences!.getString("uid"))
          .collection("orders").where("status",isEqualTo: "normal")
              .orderBy("orderTime",descending: true)
          .snapshots(),
          builder: (c, snapshot){
            return snapshot.hasData ? ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (c, index){
                return FutureBuilder<QuerySnapshot>(
                  future: FirebaseFirestore.instance.collection("users").doc
                    ("product").collection("menus")
                      .where("menuID",whereIn:
                  separateOrdersItemId((snapshot.data!.docs[index].data()!
                  as Map <String, dynamic>)
                  ["productIDs"] )).where("orderBy",
                      whereIn: (snapshot.data!.docs[index].data()! as
                      Map<String, dynamic>)
                      ["uid"]).orderBy("publishedDate",descending: true)
                  .get(),
                  builder: (c, snap){
                    return snap.hasData ?
                    OrderCard(
                      itemCount: snap.data!.docs.length,
                      data: snap.data!.docs,
                      orderID: snapshot.data!.docs[index].id,
                      separateItemQuantityList: separateOrderItemQuantity((
                          snapshot.data!.docs[index].data()! as Map<String ,dynamic>
                      )["productIDs"]),
                    ) :
                    Center(child: circularProgress(),);
                  },
                );
              },
            ):
            Center(child: circularProgress(),);
          },
        ),
      ),
    );
  }
}
