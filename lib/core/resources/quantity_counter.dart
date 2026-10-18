import 'package:flutter/material.dart';

// زرار العداد لوحده (- رقم +)
// بياخد الرقم كـ ValueNotifier وبيسمعه بنفسه،
// فالدوسة بتبني العداد ده بس ومش بتبني السكرينة
class QuantityCounter extends StatelessWidget {
  final ValueNotifier<int> quantity;

  const QuantityCounter({
    super.key,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: quantity,
      builder: (context, value, _) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _box(
              icon: Icons.remove,
              onTap: () {
                if (value > 1) quantity.value = value - 1;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '$value',
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            _box(
              icon: Icons.add,
              onTap: () => quantity.value = value + 1,
            ),
          ],
        );
      },
    );
  }

  // مربع واحد (+ أو -)
  Widget _box({required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Icon(icon, size: 16, color: Colors.black),
      ),
    );
  }
}
