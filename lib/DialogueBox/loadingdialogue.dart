import 'package:fyp_1/Widgets/loadingwidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingAlertDialog extends StatelessWidget
{
  final String? message;
   LoadingAlertDialog({ required this.message});

  @override
  Widget build(BuildContext context)
  {
    return AlertDialog(

      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          circularProgress(),
          SizedBox(
            height: 10,
          ),
          Text(message!+ ', Please wait.....'),
        ],
      ),
    );
  }
}
