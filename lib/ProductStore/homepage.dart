import 'package:flutter/material.dart';
class homePage extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.red,
      child: Padding(
        padding: EdgeInsets.all(6.0),
        child: Container(
          height: 190.0,
          width: 80.0,
          child: Row(
            children: [
              Image.asset('assets/images/oil.jpg',width: 140.0,height: 140.0,),
              SizedBox(width: 4.0,),
              Expanded(child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 15.0,),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:
                        Text("OIL",style: TextStyle(
                          color: Colors.black,fontSize: 14.0,
                        ),),),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.0,),
                  Container(
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(child:
                        Text("Cooking-Oil",style: TextStyle(
                          color: Colors.black54,fontSize: 14.0,
                        ),),),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.0,),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.red,
                        ),
                        alignment: Alignment.topLeft,
                        width: 40.0,
                        height: 30.0,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("10%",style: TextStyle(fontSize:15.0,color:
                              Colors
                                  .white,fontWeight: FontWeight.normal),),
                              Text("OFF",style: TextStyle(fontSize:12.0,color:
                              Colors
                                  .white,fontWeight: FontWeight.normal),),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10.0,),
                      Column(
                        crossAxisAlignment:CrossAxisAlignment.start,
                        children: [
                          Padding(padding:
                          EdgeInsets.only(top: 0.0),
                            child: Row(
                              children: [
                                Text("Price",style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                ),),
                                Text(""),


                              ],
                            ),),

                        ],
                      )
                    ],
                  ),
                  Flexible(child: Container(

                  ),)
                ],
              )
              ),
            ],

          ),
        ),
      ),
    );
  }
}
