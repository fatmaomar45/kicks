import 'package:flutter/material.dart';
import 'package:kicks/screens/login_screen.dart';
import 'package:kicks/screens/signup_screen.dart';
import 'package:kicks/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      theme: ThemeData(
        fontFamily: 'Schyler',
      ),
    );
  }
}