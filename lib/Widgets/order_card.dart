import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/screens/order_details_screen.dart';

class OrderCard extends StatelessWidget
{

  final int? itemCount;
  final List<DocumentSnapshot>? data;
  final String? orderID;
  final List<String>? separateItemQuantityList;

  OrderCard({
   this.itemCount,
    this.data,
    this.orderID,
    this.separateItemQuantityList,
});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)
        =>OrderDetailsScreen(orderID: orderID)));

      },
      child: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
            colors: [Colors.black12, Colors.white54],
            begin: const FractionalOffset(0.0,0.0),
            end : const FractionalOffset(1.0, 0.0),
            stops: [0.0,1.0],
            tileMode: TileMode.clamp,
          ),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        height: itemCount! * 125,
        child: ListView.builder(
          itemCount: itemCount,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context,index){
            Menus model = Menus.fromJson(data![index].data()!
            as Map<String, dynamic>) ;
            return placeOrderDesign(model, context,
                separateItemQuantityList![index]);
          },

        ),
      ),
    );
  }
}


Widget placeOrderDesign(Menus model, BuildContext context, separateItemQuantityList)
{
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 120,
    color: Colors.white,
    child: Row(
      children: [
        Image.network(model.thumbnailUrl!,width: 120,),
        SizedBox(width: 10.0,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      model.title!,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Text("Price: ",style:
                    TextStyle(
                      fontSize: 16.0,
                      color: Colors.teal,
                    ),),
                  Text(
                    model.price.toString(),
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Text("Qty: ",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize:14.0,
                  ),),
                  Expanded(
                    child: Text(
                      separateItemQuantityList,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,

                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),

  );

}
