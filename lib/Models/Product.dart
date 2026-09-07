class Product {
  final String title;
  //لو هتعمل description مخصص لكل منتج هيبقا هنا و في الProductsData
  final String image;
  final String price;

  const Product({
    required this.title,
    required this.image,
    required this.price,
  });
}