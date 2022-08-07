import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Admin/shipment.dart';
import 'package:fyp_1/Admin/statusbannerr.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/Models/address.dart';
import 'package:fyp_1/Widgets/loadingwidget.dart';
import 'package:fyp_1/Widgets/shipment_address_design.dart';
import 'package:fyp_1/Widgets/status_banner.dart';
import 'package:intl/intl.dart';

class OrderDetails extends StatefulWidget
{
  final String? orderID;

  OrderDetails({
    this.orderID
  });


  @override
  _OrderDetailsScreenState createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetails> {
  String orderStatus = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder<DocumentSnapshot>(
            future: FirebaseFirestore.instance
                .collection("users")
                .doc(sharedPreferences!.getString("uid"))
                .collection("orders")
                .doc(widget.orderID)
                .get(),
            builder: (c, snapshot) {
              Map? dataMap;
              if (snapshot.hasData) {
                dataMap = snapshot.data!.data()! as Map<String, dynamic>;
                orderStatus = dataMap["status"].toString();
              }
              return snapshot.hasData ? Container(
                child: Column(
                  children: [
                    Status(
                      status: dataMap!["isSuccess"],
                      orderStatus: orderStatus,
                    ),
                    SizedBox(height: 10.0,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Total Amount = "
                              "Rs: " + dataMap["totalAmount"].toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Product Name = " + dataMap["title"].toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Quantity = " + dataMap["qty"].toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Order Id: " +
                          widget.orderID!,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,

                        ),

                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Payment Details = "
                              + dataMap["paymentDetails"].toString(),
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),
                    ),


                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Order at: " +
                          DateFormat("dd MMMM, yyyy - hh:mm aa")
                              .format(DateTime.fromMillisecondsSinceEpoch(int
                              .parse
                            (dataMap["orderTime"])))
                        , style: TextStyle(fontSize: 16.0,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,

                        ),),
                    ),
                    Divider(thickness: 4),
                    FutureBuilder<DocumentSnapshot>(
                      future: FirebaseFirestore.instance
                          .collection("users")
                          .doc(sharedPreferences!.getString("uid"))
                          .collection("userAddress")
                          .doc(dataMap["addressID"])
                          .get(),
                      builder: (c, snapshot) {
                        return snapshot.hasData ?
                        ShipmentAddress(
                          model: Address.fromJson(
                              snapshot.data!.data()! as Map<String, dynamic>
                          ),
                          orderStatus: orderStatus,
                          orderId: widget.orderID,
                          orderBy: widget.orderID,



                        ) :
                        Center(child: circularProgress(),);
                      },
                    ),
                    Divider(thickness: 4),
                  ],
                ),
              ) :
              Center(child:
              circularProgress(),);
            }
        ),
      ),
    );
  }
}