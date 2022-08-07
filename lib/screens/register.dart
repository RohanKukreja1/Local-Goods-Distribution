import 'dart:io';

import 'package:fyp_1/Global/global.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/DialogueBox/loadingdialogue.dart';
import 'package:fyp_1/ProductStore/home.dart';
import 'package:fyp_1/Widgets/custome_textfield.dart';
import 'package:fyp_1/DialogueBox/erroemessage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;
import 'package:shared_preferences/shared_preferences.dart';

class Registration_Screen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<Registration_Screen> {
   XFile? imageXFile;
   final ImagePicker _picker = ImagePicker();
   String userImageUrl="";


   Future<void> fromValidation()async {
     if (imageXFile == null) {
       showDialog(
           context: context,
           builder: (c) {
             return ErrorAlertDialog(
               message: "Please Select a Image",
             );
           }
       );
     }
     else {
       if (_passwordTextEditingController.text ==
           _rpasswordTextEditingController.text) {
         if(_passwordTextEditingController.text.isNotEmpty
             &&_rpasswordTextEditingController.text
                 .isNotEmpty&&_emailTextEditingController.text.isNotEmpty){
           //
           showDialog(
               context: context,
               builder: (c)
           {
             return LoadingAlertDialog(
               message: "Wait a second account is registering",
             );
           }
           );
           String fileName = DateTime.now().microsecondsSinceEpoch.toString();
           fStorage.Reference reference=fStorage.FirebaseStorage.instance.ref
             ().child("users").child(fileName);
           fStorage.UploadTask uploadTask=reference.putFile(File(imageXFile!
               .path));
           fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete
             (() {});
           await taskSnapshot.ref.getDownloadURL().then((url){
             userImageUrl= url;

             signUp();

           } );

         }
         else{
           showDialog(
               context: context,
               builder: (c) {
                 return ErrorAlertDialog(
                   message: "Please fill the required fields",
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
                 message: "Password do not match",
               );
             }
         );
       }
     }
   }
   void signUp()async{
     User? currentUser;

     await firebaseAuth.createUserWithEmailAndPassword(
       email: _emailTextEditingController.text.trim(),
       password: _passwordTextEditingController.text.trim(),
     ).then((auth) {
       currentUser=auth.user;
     }).catchError((error){
       Navigator.pop(context);
       showDialog(
           context: context,
           builder: (c)
       {
         return ErrorAlertDialog(
           message: error.message.toString(),
         );
       }
       );

     });
     if(currentUser !=null){
       saveDataToFireStore(currentUser!).then((value) {
         Navigator.pop(context);
         Route newRoute = MaterialPageRoute(builder: (c)=>storehome());
         Navigator.pushReplacement(context, newRoute);
       }

       );
     }

   }
   Future saveDataToFireStore(User currentUser)async{
      FirebaseFirestore.instance.collection("users").doc(currentUser.uid).set({
        "userID":currentUser.uid,
        "userEmail":currentUser.email,
        "userName":_nameTextEditingController.text.trim(),
        "userAvatarUrl":userImageUrl,
        "phone":_mobileTextEditingController.text.trim(),
        "userCart":['garbageValue'],
      });
       sharedPreferences=await SharedPreferences.getInstance();
      await sharedPreferences!.setString("uid",currentUser.uid);
      await sharedPreferences!.setString("name",_nameTextEditingController
          .text.trim());
      await sharedPreferences!.setString("photourl",userImageUrl);
      await sharedPreferences!.setStringList("userCart", ['garbageValue']);

   }

   Future<void> _getImage()async{
     imageXFile = await  _picker.pickImage(source: ImageSource.gallery);
     setState(() {
       imageXFile;
     });
   }

   final TextEditingController
   _nameTextEditingController = TextEditingController();
  final TextEditingController
  _emailTextEditingController = TextEditingController();
  final TextEditingController
  _passwordTextEditingController = TextEditingController();
  final TextEditingController
  _rpasswordTextEditingController = TextEditingController();
  final TextEditingController
  _mobileTextEditingController = TextEditingController();


  final _formKey = GlobalKey<FormState>();
   bool checkedValue = false;
   bool checkboxValue = false;

  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery.of(context).size.width,
        _screenHeight = MediaQuery
            .of(context)
            .size
            .height;

    return SingleChildScrollView(
      child: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 10.0,),
            InkWell(
              onTap: () {_getImage();},
              child: CircleAvatar(
                radius:_screenWidth*0.15,
                backgroundColor: Colors.grey,
                backgroundImage: imageXFile == null ? null :FileImage
                  (File(imageXFile!.path)),
                    child: imageXFile ==null?
                    Icon(Icons.add_photo_alternate,size:_screenWidth*0.15,
                  color: Colors.black45,) :null,
              ),
            ),
            SizedBox(height: 15.0),
            Form(
              key: _formKey,
              child: Column(
                 children: [
                   CustomTextField(
                     controller: _nameTextEditingController,
                     data:Icons.person,
                     hintText: "Name",
                     isObsecure:false,
                   ),
                   CustomTextField(
                     controller: _emailTextEditingController,
                     data:Icons.email,
                     hintText: "Email",
                     isObsecure:false,
                   ),
                   CustomTextField(
                     controller: _passwordTextEditingController,
                     data:Icons.lock,
                     hintText: "Password",
                     isObsecure:true,
                   ),
                   CustomTextField(
                     controller: _rpasswordTextEditingController,
                     data:Icons.lock,
                     hintText: "Confirm-Password",
                     isObsecure:true,
                   ),
                   CustomTextField(
                     controller: _mobileTextEditingController,
                     data:Icons.phone,
                     hintText: "Mobile No:",
                     isObsecure:false,
                   ),
                 ],
              ),
            ),
            SizedBox(height: 15.0),

            ElevatedButton(

            child: Text("Sign up",style: TextStyle(
              color: Colors.white
            ),),
            style: ElevatedButton.styleFrom(
              primary: Color(0XFF3b5998),
              minimumSize: Size(276,38),
              alignment: Alignment.center,

            ),
              onPressed: (){
              fromValidation();
              },
            ),
            SizedBox(height: 30.0),
            Container(
              height: 4.0,
              width: _screenWidth*0.8,
              color: Colors.white,
            ),
            SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
