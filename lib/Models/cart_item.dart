class CartItem {
  final String id;
  final String title;
  final String image;
  final num price;
  final String size;

  const CartItem({
    required this.id,
    required this.title,
    required this.image,
    required this.price,
    required this.size,
  });

  // تحويل من Firestore لموديل
  factory CartItem.fromMap(String id, Map<String, dynamic> map) {
    return CartItem(
      id: id,
      title: map['title'] ?? '',
      image: map['image'] ?? '',
      price: map['price'] ?? 0,
      size: map['size'] ?? '',
    );
  }
}
