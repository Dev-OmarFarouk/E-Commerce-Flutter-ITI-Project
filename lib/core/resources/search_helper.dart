import '../../Models/Product.dart';
import 'ProductsData.dart';

List<Product> filterProducts(String query) {
  final q = query.trim().toLowerCase();
  if (q.isEmpty) return [];

  if (q == 'tech') {
    return products
        .where((p) => ['watch', 'lg tv', 'airpods']
            .contains(p.title.toLowerCase()))
        .toList();
  }
  if (q == 'shoes' || q == 'shoe') {
    return products
        .where((p) => p.title.toLowerCase().contains('shoe'))
        .toList();
  }
  if (q == 'clothes' || q == 'cloth') {
    return products
        .where((p) => ['jacket', 'hoodie', 'black shirt', 'pink shirt']
            .contains(p.title.toLowerCase()))
        .toList();
  }

  return products
      .where((p) => p.title.toLowerCase().contains(q))
      .toList();
}
