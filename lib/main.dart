import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fyp_1/Counters/cartItem.dart';
import 'package:fyp_1/Global/global.dart';
import 'package:fyp_1/calling/total_amount.dart';
import 'package:fyp_1/screens/splash_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


import 'Counters/changeAddress.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPreferences = await SharedPreferences.getInstance();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor:
    Colors.transparent));
    return MultiProvider(
      providers:[
      ChangeNotifierProvider(create: (c)=>CartItemCounter()),
      ChangeNotifierProvider(create: (c)=>TotalAmount()),
        ChangeNotifierProvider(create: (c)=>AddressChanger()),

      
      
    ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    ),
    );
  }
}