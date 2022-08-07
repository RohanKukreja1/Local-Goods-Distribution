import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/screens/categories.dart';
class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  
  final _formKey = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  
  Future resetPassword() async{
    await FirebaseAuth.instance.sendPasswordResetEmail
      (email: _emailcontroller.text);
  }
  
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reset Password"),
        centerTitle: true,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(_)
            =>categories_screen()));
          },
        ),
        
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 150,horizontal: 15),
          child: ListView(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: TextFormField(
                  autofocus: true,
                  enabled: true,
                  decoration: InputDecoration(
                    labelText: "Email",
                    labelStyle: TextStyle(
                      fontSize: 14,
                    ),
                    border: OutlineInputBorder(),
                    errorStyle: TextStyle(
                      color: Colors.red,fontSize: 14
                    ),
                  ),
                  controller: _emailcontroller,
                ),
              ),
              SizedBox(height: 20,),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                      resetPassword();  
                      }, child: Text(
                      "Reset Password",
                      style: TextStyle(
                        color: Colors.white
                      ),
                     ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0XFF3b5998),
                        minimumSize: Size(276,38),
                        alignment: Alignment.center,
                    ),),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
