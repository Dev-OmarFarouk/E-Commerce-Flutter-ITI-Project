import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../core/resources/HomeSlider.dart';
import '../../core/resources/ProductsData.dart';
import '../../core/resources/ProductCard.dart';
import '../AllProducts/AllProducts.dart';

class Home extends StatelessWidget {
  // لما تدوس على الـ container بتاع السيرش نروح لتاني حاجة في النافبار
  final VoidCallback? onSearchTap;

  const Home({super.key, this.onSearchTap});

  @override
  Widget build(BuildContext context) {

    final email = FirebaseAuth.instance.currentUser?.email ?? '';
    final name = email.contains('@') ? email.split('@')[0] : email;
    final initial = name.isNotEmpty ? name[0].toUpperCase() : '?';
    final featured = products.sublist(0, 4);
    final mostPopular = products.sublist(4, 8);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 27,
                          backgroundColor: Color(0xff6055D8),
                          child: Text(
                            initial,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),

                        const SizedBox(width: 10),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello!',
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              name,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(
                        Icons.notifications,
                        size: 30,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: onSearchTap,
                  child: Container(
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 30,
                          color: Colors.grey.shade700,
                        ),

                        const SizedBox(width: 12),

                        Text(
                          'Search here',
                          style: TextStyle(
                            color: Colors.grey.shade500,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 22),
                HomeSlider(),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Featured', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => AllProducts()));
                      },
                      child: Text('See All', style: TextStyle(color: Color(0xff6055D8))),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 265,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 160,
                        child: ProductCard(product: featured[index]),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Most Popular', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (_) => AllProducts()));
                      },
                      child: Text('See All', style: TextStyle(color: Color(0xff6055D8))),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                SizedBox(
                  height: 265,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: featured.length,
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 160,
                        child: ProductCard(product: mostPopular[index]),
                      );
                    },
                  ),
                )

              ],
            ),
          ),
        ),
      ),

    );
  }
}
