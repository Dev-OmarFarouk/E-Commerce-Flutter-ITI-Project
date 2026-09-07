import 'package:flutter/material.dart';
import '../Cart/Cart.dart';
import '../Home/Home.dart';
import '../Profile/Profile.dart';
import '../Search/Search.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int currentIndex = 0;
  List<Widget> screens = [Home(), Search(), Cart(), Profile()]; //هنا اسماء الاسكرينات
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
          label: ""),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
              label: ""),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
              label: "")
        ],
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed, backgroundColor: Color(0xffF8F7F7),
        iconSize: 35,
        selectedItemColor: Color(0xff6055D8),
        

      ),
    );
  }
}
