import 'package:flutter/material.dart';

class CartSummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool bold;

  const CartSummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              color: bold ? Colors.black : Colors.grey.shade600,
              fontWeight: bold ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: bold ? Colors.black : Colors.grey.shade800,
            ),
          ),
        ],
      ),
    );
  }
}
