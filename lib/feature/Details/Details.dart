import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import '../../Models/Product.dart';
import '../../core/network/services/cart_service.dart';
import '../../core/resources/Heart.dart';
import '../../core/resources/size_selector.dart';
import '../../core/resources/snack_bar.dart';
import '../Cart/Cart.dart';

class Details extends StatelessWidget {
  final Product product;

  // المقاس المختار (بيتحدث من الـ SizeSelector وهيتبعت للكارت)
  final ValueNotifier<String> selectedSize = ValueNotifier('10');

  Details({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    image: DecorationImage(
                      image: AssetImage(product.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back,
                                color: Colors.black),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey.shade300,
                          child: const Heart(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        product.price,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff6055D8),
                        ),
                      ),
                    ],
                  ),

                const SizedBox(height: 6),

                Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber, size: 25),
                      SizedBox(width: 4),
                      Text('4.5',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                      SizedBox(width: 4),
                      Text('(20 Review)',
                          style: TextStyle(fontSize: 17, color: Colors.grey)),
                    ],
                  ),

                const SizedBox(height: 12),

                 Text(
                    'Description',
                    style: TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),

                const SizedBox(height: 6),
                Text(
                    'Culpa aliquam consequuntur veritatis at consequuntur '
                    'praesentium beatae temporibus nobis. Velit dolorem '
                    'facilis neque autem. Itaque voluptatem expedita qui '
                    'exercitationem veritatis neque. Blanditiis quasi nemo '
                    'Nobis laudantium nesciunt perspiciatis aut eligendi.',
                    style: TextStyle(color: Colors.grey, fontSize: 20),
                  ),

                const SizedBox(height: 65),
                 Text(
                    'Size',
                    style: TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),

                const SizedBox(height: 8),
                 SizedBox( height: 50, width: 250,
                      child: SizeSelector(
                        onChanged: (size) => selectedSize.value = size,
                      )
                  ),

                const SizedBox(height: 20),

                Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            // إضافة للكارت بالمقاس المختار
                            await CartService.addToCart(
                              title: product.title,
                              image: product.image,
                              priceText: product.price,
                              size: selectedSize.value,
                            );
                            if (context.mounted) {
                              showMySnackBar(
                                msg: 'Added successfully',
                                type: AnimatedSnackBarType.success,
                                context: context,
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xff6055D8),
                            fixedSize: Size.fromHeight(55),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text(
                            'Buy Now',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      GestureDetector(
                        // الدوسة على الشنطة تروح لسكرينة الكارت
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const Cart(),
                            ),
                          );
                        },
                        child: Container(
                          height: 55,
                          width: 55,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.grey.shade700,
                            size: 28,
                          ),
                        ),
                      ),
                    ],
                  ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
