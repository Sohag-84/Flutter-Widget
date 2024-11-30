class Product {
  final int id;
  final String name, description;
  final String images;
  final double rating, price;
  int stock;
  final bool isFavourite;

  Product({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    required this.stock,
    required this.name,
    required this.price,
    required this.description,
  });
}
