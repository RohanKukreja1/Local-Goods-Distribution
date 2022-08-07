
import 'package:flutter/material.dart';
import 'package:fyp_1/Admin/admin_home.dart';
import 'package:fyp_1/Widgets/custome_textfield.dart';
import 'package:fyp_1/DialogueBox/erroemessage.dart';
import 'package:fyp_1/Admin/uploaditems.dart';
import 'package:fyp_1/screens/categories.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class AdminSignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
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
      body: AdminSignInScreen(),
    );
  }
}
class AdminSignInScreen extends StatefulWidget {
  @override
  _AdminSignInScreenState createState() => _AdminSignInScreenState();
}
class _AdminSignInScreenState extends State<AdminSignInScreen> {
  final TextEditingController
  _adminIDTextEditingController = TextEditingController();
  final TextEditingController
  _passwordTextEditingController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    double _screenWidth = MediaQuery
        .of(context)
        .size
        .width,
        _screenHeight =
            MediaQuery
                .of(context)
                .size
                .height;
    return Material(
      child: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: const FractionalOffset(0.0, 0.0),
              end: const FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 12.0,),

              Image.asset('assets/images/Admin.jpg',width: 180.0,height:
              180.0,),
              SizedBox(height: 30.0),
              Form(

                child: Column(
                  children: [
                    CustomTextField(
                      controller: _adminIDTextEditingController,
                      data: Icons.person,
                      hintText: "ID",
                      isObsecure: false,
                    ),
                    CustomTextField(
                      controller: _passwordTextEditingController,
                      data: Icons.visibility,
                      hintText: "Password",
                      isObsecure: true,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0),
              ElevatedButton(
                onPressed: () {
                _adminIDTextEditingController.text.isNotEmpty
                    && _passwordTextEditingController.text.isNotEmpty
                    ? LoginAdmin() :
                showDialog(context: context,
                    builder: (c) {
                      return ErrorAlertDialog(message: "Please fill the "
                          "required fields");
                    }
                );

              },
                child: Text("Log In", style: TextStyle(
                    color: Colors.white
                ),),
                style: ElevatedButton.styleFrom(

                  primary: Color(0XFF3b5998),
                  minimumSize: Size(276,38),
                  alignment: Alignment.center,

                ),),
              SizedBox(height: 170.0),
              Container(
                height: 4.0,
                width: _screenWidth * 0.8,
                color: Colors.white,
              ),
              SizedBox(height: 10.0),
              FlatButton.icon(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => categories_screen()));
                },
                icon: (Icon(Icons.account_box_outlined,
                    size: 40, color: Colors.red)),
                label: Text(
                  "I am not Admin", style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
                ),
              ),
              SizedBox(height: 90.0,)
            ],
          ),
        ),),
    );
  }

  LoginAdmin() {
    FirebaseFirestore.instance.collection("users").get().then(
            (snapshot) {
      snapshot.docs.forEach((result) {
        if (result.data()["id"] != _adminIDTextEditingController.text.trim
          ()) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Your ID "
              "is not correct"),));
        }
        else
        if (result.data()["password"] != _passwordTextEditingController.text
            .trim
          ()) {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Your "
              "Password is not correct"),));
        }
        else {
          Scaffold.of(context).showSnackBar(SnackBar(content: Text("Welcome "
              "Dear Admin, " + result.data()["name"]),));
          setState(() {
            _adminIDTextEditingController.text = "";
            _passwordTextEditingController.text = "";
          });
          Route route = MaterialPageRoute(builder: (c) => AdminHome());
          Navigator.pushReplacement(context, route);
        }
      });
    });
  }
}