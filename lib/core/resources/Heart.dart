import 'package:flutter/material.dart';

// ويدجت القلب لوحده - بسيط للمبتدئين
class Heart extends StatefulWidget {
  const Heart({super.key});

  @override
  State<Heart> createState() => _HeartState();
}

class _HeartState extends State<Heart> {
  bool isFav = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isFav = !isFav;
        });
      },
      icon: Icon(
        isFav ? Icons.favorite : Icons.favorite_border,
        color: Colors.white,
        size: 30,
      ),
    );
  }
}
