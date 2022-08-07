
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp_1/Admin/A_login.dart';
import 'package:fyp_1/DialogueBox/loadingdialogue.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/Orders/myorders.dart';
import 'package:fyp_1/ProductStore/homepage.dart';
import 'package:fyp_1/Widgets/custome_textfield.dart';
import 'package:fyp_1/DialogueBox/erroemessage.dart';
import 'package:fyp_1/ProductStore/home.dart';
import 'package:fyp_1/components/rounded_button.dart';
import 'package:fyp_1/screens/forgot.dart';
import 'package:fyp_1/screens/registeration_screen.dart';
import 'package:fyp_1/screens/categories.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fyp_1/screens/resetpassword.dart';

import 'forgot_password_page.dart';



class Login_Screen extends StatefulWidget{


  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<Login_Screen> {

  final TextEditingController
  _emailTextEditingController = TextEditingController();

  final TextEditingController
  _passwordTextEditingController = TextEditingController();

  final GlobalKey<FormState>_formKey = GlobalKey<FormState>();

  fromValidation(){
    if(_emailTextEditingController.text
        .isNotEmpty&&_passwordTextEditingController.text.isNotEmpty){
      loginNow();

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


  loginNow()async{
    showDialog(
        context: context,
        builder: (c)
        {
          return LoadingAlertDialog(
            message: "Checking Details",
          );
        }
    );
    User? currentUser;
    await firebaseAuth.signInWithEmailAndPassword(
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
    if(currentUser!=null){
      readData(currentUser!).then((value){
        Navigator.pop(context);
        Route newRoute = MaterialPageRoute(builder: (c)=>storehome());
        Navigator.pushReplacement(context, newRoute);
      });

    }

  }

  Future readData(User currentUser)async{
    await FirebaseFirestore.instance.collection("users").doc(currentUser.uid)
        .get().then((snapshot)async{
      await sharedPreferences!.setString("uid",currentUser.uid);
      await sharedPreferences!.setString("email",snapshot.data()
      !["userEmail"]);
      await sharedPreferences!.setString("name",snapshot.data()!["userName"]);
      await sharedPreferences!.setString("photourl",snapshot.data()!["userAvatarUrl"]);

      List<String> userCartList = snapshot.data()!["userCart"].cast<String>();
      await sharedPreferences!.setStringList("userCart", userCartList);
    });

  }
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
            SizedBox(height: 12.0,),

            Image.asset('assets/images/user icon.png',width: 180.0,height:
            180.0,),
            SizedBox(height: 15.0),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    controller: _emailTextEditingController,
                    data:Icons.email,
                    hintText: "Email",
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
            SizedBox(height: 15.0),
            Container(
              margin: EdgeInsets.fromLTRB(10,0,10,20),
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                 Navigator.of(context).push(MaterialPageRoute(builder:
                 (context)=>ResetPassword()));
                },
                child: Text( "Forgot your password?", style: TextStyle(
                  color: Colors.black,fontSize: 16.0,fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // SizedBox(height: 20.0,),
            // FlatButton(onPressed: (){}, child: Text("Forgot Password",
            // style: TextStyle(fontSize: 20.0,),
            //),
            //),
            SizedBox(height: 40.0),
            ElevatedButton(



              child: Text("Log In",style: TextStyle(
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
            SizedBox(height: 50.0),
            Container(
              height: 4.0,
              width: _screenWidth*0.8,
              color: Colors.grey,
            ),
            SizedBox(height: 10.0),
            FlatButton.icon(
              onPressed: (){Navigator.push(context,
                  MaterialPageRoute(builder:(context)
                  =>AdminSignInPage()));
              },
              icon:(Icon(Icons.account_box_outlined,
                  size:40,color:Colors.red)),
              label: Text(
                "Admin User",style: TextStyle(
                color: Colors.blue,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
