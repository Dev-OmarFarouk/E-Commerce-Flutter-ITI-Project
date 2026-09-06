import 'package:flutter/material.dart';
import 'package:graduation_project/Screens/profileScreen/profileScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retail Store',
      theme: ThemeData(

        colorScheme: .fromSeed(seedColor: Colors.white),
      ),
      home: ProfileScreen(),
    );
  }
}

