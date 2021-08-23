import 'package:Delivers/screens/HomePage.dart';
import 'package:Delivers/screens/MainPage.dart';
import 'package:Delivers/screens/LogIn.dart';
import 'package:Delivers/screens/Register.dart';
import 'package:flutter/material.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:smooth_star_rating/smooth_star_rating.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
     runApp(MyApp());
  }
  

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Place Details',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MainPage(),
    );
  }
}
