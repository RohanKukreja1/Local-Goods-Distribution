import 'package:flutter/material.dart';
import 'package:fyp_1/Counters/changeAddress.dart';
import 'package:fyp_1/Models/address.dart';
import 'package:fyp_1/maps/maps.dart';
import 'package:fyp_1/screens/Place_Order.dart';
import 'package:provider/provider.dart';

class AddressDesign extends StatefulWidget
{
  final Address? model;
  final int? currentIndex;
  final int? value;
  final String? addressID;
  final double? totalAmount;

  AddressDesign({
   this.model,
   this.currentIndex,
   this.value,
   this.addressID,
   this.totalAmount,
});


  @override
  _AddressDesignState createState() => _AddressDesignState();
}

class _AddressDesignState extends State<AddressDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Provider.of<AddressChanger>(context,listen: false).displayResult
          (widget.value);

      },
      child: Card(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Radio(
                  groupValue: widget.currentIndex!,
                  value: widget.value!,
                  activeColor: Colors.black,
                  onChanged: (val){
                    Provider.of<AddressChanger>(context,listen: false).displayResult(val);
                    print(val);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Table(
                        children: [
                          TableRow(
                            children: [
                              Text("Name:  ",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),),
                              Text(widget.model!.name.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text("Contact:  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text(widget.model!.phoneNumber.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text("Address:  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text(widget.model!.fullAddress.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text("City:  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text(widget.model!.city.toString()),
                            ],
                          ),
                          TableRow(
                            children: [
                              Text("State:  ",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),),
                              Text(widget.model!.state.toString()),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              child: Text("Check on Maps"),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
              ),
              onPressed: (){
                /*MapsUtils.openMapWithPosition(
                  widget.model!.lat!,
                  widget.model!.long!,
                );*/
                MapsUtils.openMapWithAddress(widget.model!.fullAddress!);
              },
            ),

            widget.value == Provider.of<AddressChanger>(context).count
             ? ElevatedButton(
                 child: Text("Proceed",style: TextStyle(fontWeight: FontWeight.bold),),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.amber,
                  ),
                 onPressed: (){
                   Navigator.push(context,MaterialPageRoute(builder: (c)=>
                       PlaceOrder(
                         addressID: widget.addressID,
                         totalAmount:widget.totalAmount,

                       )));

                 },
            ) :
            Container(

            ),

          ],
        ),
      ),
    );
  }
}
