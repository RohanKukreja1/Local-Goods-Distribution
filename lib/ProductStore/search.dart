import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Models/items.dart';
import 'package:fyp_1/Widgets/items_design.dart';
class SearchService {
}



class SearchProduct extends StatefulWidget {
  @override
  _SearchProductState createState() => new _SearchProductState();
}



class _SearchProductState extends State<SearchProduct>
{
  Future<QuerySnapshot>? productsDocumentsList;
  String title = "";

  initSearchProduct(String textEntered)
  {
    productsDocumentsList =FirebaseFirestore.instance.collection("users")
        .doc("product").collection("menus")
        .where("title",isGreaterThanOrEqualTo:textEntered)
        .get();

  }


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
        title: TextField(
          onChanged: (textEntered)
          {
            setState(() {
              title = textEntered;

            });
            initSearchProduct(textEntered);
          },
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(
              color: Colors.white54,
            ),
            border: InputBorder.none,
            suffixIcon: IconButton(
              icon: Icon(Icons.search),
              color: Colors.white,
              onPressed: (){
                initSearchProduct(title);

              },
            ),

          ),
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
          ),
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: productsDocumentsList,
        builder: (context, snaphot){
          return snaphot.hasData ?
          ListView.builder(
            itemCount: snaphot.data!.docs.length,
            itemBuilder: (context, index)
            {
              Menus model = Menus.fromJson(
                snaphot.data!.docs[index].data()! as Map<String,dynamic>
              );
              return itemsDesign(
                  model:model,
                  context: context,
              );


            },
          ):
          Center(child: Text("No Records Found"),);
        },
      ),

    );
  }
}

