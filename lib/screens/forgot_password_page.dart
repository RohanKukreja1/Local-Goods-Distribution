import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/config/config.dart';
import 'package:fyp_1/screens/login_screen.dart';

class ForgotPassword extends StatelessWidget {



  /*forgotPassword(String email)async{
    String res ='Some error occur';
    try{
      if(email.isNotEmpty){
        await firebaseAuth.sendPasswordResetEmail(email: email);
        res = 'success';
      }else{
        res='Email field must not be empty';
      }

    }catch(e){
      res = e.toString();

    }
    return res;

  }*/

  final TextEditingController _emailController = TextEditingController();

  forgotPassword()async{

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Forgot Password",style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,

            ),),
            SizedBox(height: 15.0,),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                filled: true,
                hintText: 'Enter Your Email',
                border: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 25,),
            Container(
              width: MediaQuery.of(context).size.width -40,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.black,
              ),
              child: GestureDetector(


                  child: Center(
                    child: Text("Forgot Password",style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    ),

                  ),
                ),
              ),

          ],

        ),


      ),


    );

    
  }
}


