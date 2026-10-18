import 'package:flutter/material.dart';
import '../Cart/Cart.dart';
import '../Home/Home.dart';
import '../Profile/Profile.dart';
import '../Search/product_search_delegate.dart';


class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  // مكانك في النافبار: 0 = Home, 2 = Cart, 3 = Profile
  // رقم 1 بتاع السيرش مش سكرينة، بيفتح الـ delegate على طول
  int currentIndex = 0;

  Future<void> _openSearch() async {
    await showSearch<String?>(
      context: context,
      delegate: ProductSearchDelegate(),
    );
  }

  Widget get currentScreen {
    if (currentIndex == 2) return Cart();
    if (currentIndex == 3) return Profile();
    return Home(onSearchTap: _openSearch);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentScreen,
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
          if (value == 1) {
            _openSearch();
            return;
          }
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
