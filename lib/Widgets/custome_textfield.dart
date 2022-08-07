import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData data;
  final String hintText;

  bool isObsecure = true;

  CustomTextField(
  { required this.controller,required this.data,required
  this.hintText,
    required this
  .isObsecure}
      );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(

        borderRadius: BorderRadius.all(Radius.circular(10.0)),
      ),
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(10.0),
      child: TextFormField(
        controller: controller,
        obscureText:  isObsecure,
        cursorColor: Colors.black45,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius
              .circular(100.0), borderSide: BorderSide(color: Colors.black)),
          enabledBorder: OutlineInputBorder(borderRadius: BorderRadius
              .circular(100.0), borderSide: BorderSide(color: Colors.black)),
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular
            (100.0), borderSide: BorderSide(color: Colors.black, width: 2.0)),
          focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius
              .circular(100.0), borderSide: BorderSide(color: Colors.black,
              width: 2.0)),
          prefixIcon: Icon(
            data,
            color: Colors.black,
          ),
          focusColor: Theme.of(context).primaryColor,
          hintText: hintText,
          fillColor: Colors.black,
        ),
      ),
    );
  }
}
