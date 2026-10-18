import 'package:flutter/material.dart';
import '../../Models/cart_item.dart';
import 'cart_summary_row.dart';

class CartSummary extends StatelessWidget {
  final List<CartItem> items;
  final Map<String, ValueNotifier<int>> quantities;

  const CartSummary({
    super.key,
    required this.items,
    required this.quantities,
  });

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: Listenable.merge(quantities.values.toList()),
      builder: (context, _) {
        num subtotal = 0;
        for (final item in items) {
          subtotal += item.price * (quantities[item.id]?.value ?? 1);
        }
        const shipping = 80;
        final total = subtotal + shipping;

        return Column(
          children: [
            CartSummaryRow(label: 'Sub-total', value: '\$ $subtotal'),
            const CartSummaryRow(label: 'VAT (%)', value: '\$ 0.00'),
            const CartSummaryRow(
                label: 'Shipping fee', value: '\$ $shipping'),
            const Divider(),
            CartSummaryRow(
                label: 'Total', value: '\$ $total', bold: true),
          ],
        );
      },
    );
  }
}
