

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Admin/Adrawer.dart';
import 'package:fyp_1/Admin/shiftorders.dart';
import 'package:fyp_1/DialogueBox/erroemessage.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/Widgets/loadingwidget.dart';
import 'package:fyp_1/screens/splash_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as storageRef;



class UploadPage extends StatefulWidget
{
  @override
  _UploadPageState createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage>
{
  bool get wantKeepAlive => true;
  final ImagePicker _picker = ImagePicker();
  XFile? imageXFile;
 // XFile? _image;
 // Uint8List? imag;
  //List<XFile>? _imageFileList;
  TextEditingController
  _descriptionTextEditingController=TextEditingController();
  TextEditingController
  _priceTextEditingController=TextEditingController();
  TextEditingController
  _titleTextEditingController=TextEditingController();
  TextEditingController
  _shortInfoTextEditingController=TextEditingController();

  String uniqueIdName = DateTime.now().microsecondsSinceEpoch.toString();
  bool uploading = false;




  displayAdminHomeScreen(){
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
      body: getAdminHomeScreenBody(),
    );
  }
  getAdminHomeScreenBody(){
    return Container(
      decoration: new BoxDecoration(
        gradient: new LinearGradient(
          colors: [Colors.white, Colors.white],
          begin: const FractionalOffset(0.0,0.0),
          end : const FractionalOffset(1.0, 0.0),
          stops: [0.0,1.0],
          tileMode: TileMode.clamp,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shop_two,color: Colors.black,size: 190.0,),
            Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(9.0)
                ),
                child: Text("Add New Items",style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.deepPurple,
                ),),
                onPressed: (){
                  takeImage(context );
                },
              ),

            ),
          ],
        ),
      ),
    );
  }
  takeImage(mContext){
    return showDialog(
        context: mContext,
        builder: (context)
        {
          return SimpleDialog(
            title: Text(
              "Item Image",style: TextStyle(
                color: Colors.black,fontSize:20.0,fontWeight: FontWeight.bold
            ),
            ),
            children: [
              SimpleDialogOption(
                child: const Text(
                  "Capture With Camera",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                  ),),
                onPressed: capturePhotowithCamera,

              ),
              SimpleDialogOption(
                child: const Text(
                  "Pick Photo from Gallery",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w800
                  ),),
                onPressed: pickPhotofromGallery,
              ),
              SimpleDialogOption(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                  ),),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }
  capturePhotowithCamera()async{
    Navigator.pop(context);
  //  final imagePicker = ImagePicker();
     imageXFile = await _picker.pickImage(source:
    ImageSource.camera,
        maxHeight:720.0 ,
        maxWidth:1280.0);
   // imag = await imageFile!.readAsBytes();
    setState(() {
      imageXFile;
    });
  }
  pickPhotofromGallery()async{
    Navigator.pop(context);
    //  final imagePicker = ImagePicker();
    imageXFile = await _picker.pickImage(source:
    ImageSource.gallery,
        maxHeight:720.0 ,
        maxWidth:1280.0);
    // imag = await imageFile!.readAsBytes();
    setState(() {
      imageXFile;
    });
  }

  displayAdminUploadFormScreen(){
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin:  FractionalOffset(0.0,0.0),
              end :  FractionalOffset(1.0, 0.0),
              stops: [0.0,1.0],
              tileMode: TileMode.clamp,
            ),
          ),),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,color: Colors.black,
          ),
          onPressed: clearFormInfo,
        ),
        title: Text("New Product",style: TextStyle(
          color: Colors.green,
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          TextButton(
            child: const Text(
              "Add",style: TextStyle(
                color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.bold
            ),
            ),
              onPressed:uploading ? null: ()=>validateUpload(),
          ),
        ],
      ),
      body: ListView(
        children: [
          uploading == true ? linearProgress():Text(""),
          Container(
            height: 230.0,
            width: MediaQuery.of(context).size.width*0.8,
            child:Center(
              child: AspectRatio(
                aspectRatio: 16/9 ,
                child:Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:FileImage(
                            File(imageXFile!.path)
                        ),
                        //Image.memory(imag!).image,
                        fit: BoxFit.cover
                    ),
                  ),
                ),
              ),
            ) ,
          ),
          Padding(
            padding: EdgeInsets.only(top: 12.0),
          ),
          ListTile(
            leading: Icon(
              Icons.perm_device_information,color: Colors.red,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _shortInfoTextEditingController,
                decoration: InputDecoration(
                  hintText: "Short Info",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent,),
                  border:InputBorder.none,),),
            ),
          ),
          Divider(color: Colors.red,
          ),
          ListTile(
            leading: Icon(
              Icons.title,color: Colors.red,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _titleTextEditingController,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent,),
                  border:InputBorder.none,),),
            ),
          ),
          Divider(color: Colors.red,),
          ListTile(
            leading: Icon(
              Icons.description,color: Colors.red,),
            title: Container(
              width: 250.0,
              child: TextField(
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _descriptionTextEditingController,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent,),
                  border:InputBorder.none,),),
            ),
          ),
          Divider(color: Colors.red,),

          ListTile(
            leading: Icon(
              Icons.camera,color: Colors.red,),
            title: Container(
              width: 250.0,
              child: TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.deepPurpleAccent),
                controller: _priceTextEditingController,
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.deepPurpleAccent,),
                  border:InputBorder.none,),),
            ),
          ),
          Divider(color: Colors.red,),
        ],
      ),
    );
  }
  clearFormInfo()
  {
    setState(()
    {
      imageXFile=null;
      _descriptionTextEditingController.clear();
      _priceTextEditingController.clear();
      _shortInfoTextEditingController.clear();
      _titleTextEditingController.clear();
      //_quantityTextEditingController.clear();
    });
  }
  validateUpload()async {
    if (imageXFile != null) {
      if (_shortInfoTextEditingController.text.isNotEmpty &&
          _titleTextEditingController.text
              .isNotEmpty && _priceTextEditingController.text
          .isNotEmpty && _descriptionTextEditingController.text.isNotEmpty

      ) {
        setState(() {
          uploading = true;
        });
        String downloadUrl = await uploadImage(File(imageXFile!.path));

        saveInfo(downloadUrl);
      }
      else {
        showDialog(
            context: context,
            builder: (c) {
              return ErrorAlertDialog(
                message: "Please filled the details first",
              );
            }
        );
      }
    }
    else {
      showDialog(
          context: context,
          builder: (c) {
            return ErrorAlertDialog(
              message: "Please pick an image",
            );
          }
      );
    }
  }
  saveInfo(String downloadUrl) {
    final ref = FirebaseFirestore.instance.collection("users")
        .doc("product").collection("menus");
      //(sharedPreferences!.getString("")).collection("menus");

    ref.doc(uniqueIdName).set({
      "menuID": uniqueIdName,
      "admin": sharedPreferences!.getString("adminUid"),
      "shortInfo": _shortInfoTextEditingController.text.toString(),
      "title": _titleTextEditingController.text.toString(),
      //"quantity":int.parse(_quantityTextEditingController.text),
      "price": int.parse(_priceTextEditingController.text),
      "description": _descriptionTextEditingController.text.toString(),
      "publishedDate": DateTime.now(),
      "status": "available",
      "thumbnailUrl": downloadUrl,

    });
    clearFormInfo();
    setState(() {
      uniqueIdName=DateTime.now().microsecondsSinceEpoch.toString();
      uploading=false;
    });

  }

    uploadImage(mImageFile)async{
      storageRef.Reference reference = storageRef.FirebaseStorage.instance
          .ref().child("menus");
      storageRef.UploadTask uploadTask = reference.child(uniqueIdName
          +".jpg").putFile(mImageFile);
      storageRef.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(()
      {});
      String downloadUrl=await taskSnapshot.ref.getDownloadURL();
      return downloadUrl;
    }
  @override
  Widget build(BuildContext context) {
    return imageXFile == null ? displayAdminHomeScreen()
        :displayAdminUploadFormScreen();
  }
}
