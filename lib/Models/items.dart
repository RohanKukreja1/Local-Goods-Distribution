import 'package:cloud_firestore/cloud_firestore.dart';

class Menus{
  String? admin;
  String? description;
  String? menuID;
  //String? price;
  Timestamp? publishedDate ;
  String? shortInfo;
  String? status;
  String? thumbnailUrl;
  String? title;
  int?  price;


  Menus({
   this.admin,
   this.description,
   this.menuID,
   this.publishedDate,
   this.shortInfo,
   this.status,
   this.thumbnailUrl,
   this.title,
   });

  Menus.fromJson(Map<String,dynamic> json){
    admin = json['admin'];
    description = json['description'];
    menuID = json['menuID'];
    publishedDate = json['publishedDate'];
    shortInfo = json['shortInfo'];
    status = json['status'];
    thumbnailUrl = json['thumbnailUrl'];
    title = json['title'];
    price =json['price'];

  }


  Map<String,dynamic> toJson()
  {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['admin'] = admin;
    data['description'] = description;
    data['menuID'] = menuID;
    data['price'] = price;
    data['publishedDate'] = publishedDate;
    data['shortInfo'] = shortInfo;
    data['status'] =status;
    data['thumbnailUrl'] = thumbnailUrl;
    data['title'] = title;

    return data;



  }

}
