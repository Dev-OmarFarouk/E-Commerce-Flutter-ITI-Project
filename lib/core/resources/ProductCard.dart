import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import '../../Models/Product.dart';
import '../../core/network/services/cart_service.dart';
import '../../core/resources/snack_bar.dart';
import '../../feature/Details/Details.dart';
import 'Heart.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // الدوسة على الكارت تودي على الـ details
        // (الـ heart والـ + عندهم دوسة خاصة بيهم فمش بيفتحوها)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => Details(product: product),
          ),
        );
      },
      child: Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          // الصورة + القلب فوقها
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                image: AssetImage(product.image),
                fit: BoxFit.cover,
              ),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Heart(),
              ],
            ),
          ),

          // الاسم والسعر وزرار +
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      product.price,
                      style: const TextStyle(
                        color: Color(0xff6055D8),
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  // دوسة الـ + بتضيف للكارت بمقاس default (مش بتفتح الـ details)
                  onTap: () async {
                    await CartService.addToCart(
                      title: product.title,
                      image: product.image,
                      priceText: product.price,
                      size: '10',
                    );
                    if (context.mounted) {
                      showMySnackBar(
                        msg: 'Added successfully',
                        type: AnimatedSnackBarType.success,
                        context: context,
                      );
                    }
                  },
                  child: const CircleAvatar(
                    radius: 11,
                    backgroundColor: Color(0xff6055D8),
                    child: Icon(
                      Icons.add,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      ),
    );
  }
}
