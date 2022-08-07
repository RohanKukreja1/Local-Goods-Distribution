import 'package:flutter/material.dart';


class MyTextField extends StatelessWidget
{
  String? hint;
  final TextEditingController? controller;

  MyTextField({this.controller,this.hint});


  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration.collapsed(hintText: hint),
          validator: (value)=> value!.isEmpty? "Text Field can not Empty":null,
        ),
    );
  }
}
