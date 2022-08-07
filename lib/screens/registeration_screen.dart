import 'dart:io';


import 'package:flutter/material.dart';
import 'package:fyp_1/Widgets/custome_textfield.dart';
import 'package:fyp_1/DialogueBox/erroemessage.dart';
import 'package:fyp_1/DialogueBox/loadingdialogue.dart';
import 'package:fyp_1/screens/categories.dart';
import 'package:fyp_1/screens/login_screen.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'dart:ui';

class Registration_Screen extends StatefulWidget {
  static const String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<Registration_Screen> {
  final TextEditingController
  _nameTextEditingController = TextEditingController();
  final TextEditingController
  _emailTextEditingController = TextEditingController();
  final TextEditingController
  _mobileTextEditingController = TextEditingController();
  final TextEditingController
  _shopnameTextEditingController = TextEditingController();
  final TextEditingController
  _addressTextEditingController = TextEditingController();
  final TextEditingController
  _passwordTextEditingController = TextEditingController();
  String userImageUrl="";
   File? _imageFile;
  Uint8List? imag;


  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

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
            SizedBox(height: 10.0),
            InkWell(
              onTap: _selectAndPickImage,
              child: CircleAvatar(
                radius:_screenWidth*0.15,
                backgroundColor: Colors.white,
                 backgroundImage: _imageFile == null ? null :Image.memory
                   (imag!).image,
                child: _imageFile == null
                    ?Icon(Icons.add_photo_alternate,size:_screenWidth*0.15,
                  color: Colors.grey,) :null,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),

            Form(
              key: _formKey,
              child: Column(
                 children: [
                   CustomTextField(
                     controller: _nameTextEditingController,
                     data:Icons.person,
                     hintText: "Full-Name",
                     isObsecure:false,
                   ),
                   CustomTextField(
                     controller: _emailTextEditingController,
                     data:Icons.email,
                     hintText: "Email",
                     isObsecure:false,
                   ),
                   CustomTextField(
                     controller: _mobileTextEditingController,
                     data:Icons.phone,
                     hintText: "Mobile No:",
                     isObsecure:false,
                   ),
                   CustomTextField(
                     controller: _shopnameTextEditingController,
                     data:Icons.location_city,
                     hintText: "Shop-Name",
                     isObsecure:false,
                   ),
                   CustomTextField(
                     controller: _addressTextEditingController,
                     data:Icons.location_on,
                     hintText: "Address",
                     isObsecure:false,
                   ),
                   CustomTextField(
                     controller: _passwordTextEditingController,
                     data:Icons.visibility,
                     hintText: "Password",
                     isObsecure:true,
                   ),

                 ],

              ),
            ),
            RaisedButton(onPressed: () {
              _nameTextEditingController.text.isNotEmpty
                  && _emailTextEditingController.text.isNotEmpty
                  && _mobileTextEditingController.text.isNotEmpty
                  && _shopnameTextEditingController.text.isNotEmpty
                  && _addressTextEditingController.text.isNotEmpty
                  && _passwordTextEditingController.text.isNotEmpty
                  ? Login_Screen() :
              showDialog(context: context,
                  builder: (c) {
                    return ErrorAlertDialog(message: "Please fill the "
                        "required fields");
                  }
              );
            },


            color: Colors.red,
            child: Text("Sign up",style: TextStyle(
              color: Colors.white
            ),),

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
  Future<void> _selectAndPickImage()async{
    _imageFile =  (await ImagePicker.platform.pickImage(source: ImageSource
       .gallery)) as File;

  }
}
