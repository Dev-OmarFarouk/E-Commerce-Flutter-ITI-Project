import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeSlider extends StatefulWidget {
  const HomeSlider({super.key});

  @override
  State<HomeSlider> createState() => _HomeSliderState();
}

class _HomeSliderState extends State<HomeSlider> {
  int currentIndex = 0;

  final List<Map<String, dynamic>> cards = [
    {
      'title': 'Get Winter Discount',
      'discount': '20% Off',
      'subtitle': 'For Children',
      'image': 'assets/images/littleGirl.png',
      'color': Color(0xFF6055D8),
    },
    {
      'title': 'Get Summer Discount',
      'discount': '30% Off',
      'subtitle': 'For Everyone',
      'image': 'assets/images/SummerMan.png',
      'color': Color(0xFFFF9800),
    },
    {
      'title': 'Special Offer',
      'discount': '15% Off',
      'subtitle': 'For Students',
      'image': 'assets/images/Student.png',
      'color': Color(0xFF4CAF50),
    },
    {
      'title': 'New Discount',
      'discount': '25% Off',
      'subtitle': 'For Families',
      'image': 'assets/images/Family.png',
      'color': Color(0xFFE91E63),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        CarouselSlider(
          items: cards.map((card) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 6),
              decoration: BoxDecoration(
                color: card['color'],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        card['title'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        card['discount'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        card['subtitle'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),

                  const Spacer(),

                  Image.asset(
                    card['image'],
                    height: 150,
                  ),

                  const SizedBox(width: 10),
                ],
              ),
            );
          }).toList(),

          options: CarouselOptions(
            height: 150,
            viewportFraction: 0.9,
            autoPlay: true,

            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
        ),

        const SizedBox(height: 8),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            cards.length,
                (index) => Container(
              width: currentIndex == index ? 8 : 6,
              height: currentIndex == index ? 8 : 6,
              margin: const EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: currentIndex == index
                    ? const Color(0xFF6055D8)
                    : Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
