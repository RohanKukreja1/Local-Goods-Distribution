import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Counters/changeAddress.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/Models/address.dart';
import 'package:fyp_1/Widgets/address_design.dart';
import 'package:provider/provider.dart';

import 'SaveAddress_Screen.dart';


class AddressScreen extends StatefulWidget
{
  final double? totalAmount;

  AddressScreen({
    this.totalAmount
});


  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
         /*
              "Good Luck Traders",
              style: TextStyle(
                  fontSize: 20.0, color: Colors.white,fontFamily: ''
              ),*/
           ),
           centerTitle: true,
           ),
      floatingActionButton: FloatingActionButton.extended(
        label: Text(
          "Add New Address",
        ),
          backgroundColor: Colors.amber,
          icon: Icon(Icons.add_location,color: Colors.black,),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (c)=> SaveAddressScreen()));

           },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Select Address:",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),

          ),

          Consumer<AddressChanger>(builder:(context, address, c){
            return Flexible(
              child: StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("users")
                    .doc(sharedPreferences!.getString("uid"))
                    .collection("userAddress")
                    .snapshots(),
                builder: (context, snapshot){
                  return !snapshot.hasData ? Center(child:
                  CircularProgressIndicator(),) :
                  snapshot.data!.docs.length == 0 ? Container() :
                  ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index){
                         return AddressDesign(
                             currentIndex: address.count,
                             value: index,
                             addressID: snapshot.data!.docs[index].id,
                             totalAmount: widget.totalAmount,
                           model:  Address.fromJson(
                             snapshot.data!.docs[index].data()! as Map<String, dynamic>
                           ),
                         );
                      },
                  );
                },
              ),
            );
          }),
        ],
      ),

     );
  }
}
