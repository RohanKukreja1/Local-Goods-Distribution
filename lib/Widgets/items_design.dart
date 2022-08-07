import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/ProductStore/items_details.dart';

class itemsDesign extends StatefulWidget {
  Menus? model;
  BuildContext? context;

  itemsDesign({
    this.model,
    this.context
});


  @override
  _itemsDesignState createState() => _itemsDesignState();
}

class _itemsDesignState extends State<itemsDesign> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (c)=>ItemsDetails(model:widget.model)));

      },
      splashColor: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Container(
          padding: EdgeInsets.all(10),
          height: 220,
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
              Text(
                widget.model!.title!,
                style: TextStyle(color: Colors.black,
                    fontSize: 25,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
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
