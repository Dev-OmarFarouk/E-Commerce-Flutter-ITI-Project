import 'package:flutter/material.dart';
import 'feature/AllProducts/AllProducts.dart';
import 'feature/NavBar/NavBar.dart';


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

        colorScheme: .fromSeed(seedColor: Colors.grey.shade100),
      ),
      home: AllProducts(),
    );
  }
}

