import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fyp_1/DialogueBox/erroemessage.dart';
class forgot extends StatefulWidget {


  @override
  _forgotState createState() => _forgotState();
}

class _forgotState extends State<forgot> {

  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override


  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(

      elevation: 0,
      title: Text('Reset Password'),
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Receive an email to\n Reset Your Password",
            textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: emailController,
              cursorColor: Colors.white,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: 'Email'),

            ),
            SizedBox(height: 20,),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                minimumSize: Size.fromHeight(50),

              ),
              icon: Icon(Icons.email_outlined),
              label: Text('Reset Password',
              style: TextStyle(fontSize: 24),),
              onPressed: (){
                resetPassword();

              },
            )

          ],
        ),
      ),
    ),
  );
  Future resetPassword()async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController
          .text);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    Navigator.pop(context);
    showDialog(
        context: context,
        builder: (c) {
          return ErrorAlertDialog(
            message: "Password ResetEmail Sent in you Email",
          );
        }
    );

  }

  }

