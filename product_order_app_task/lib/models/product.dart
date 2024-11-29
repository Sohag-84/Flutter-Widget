class Product {
  final int id;
  final String title, description;
  final String images;
  final double rating, price;
  final int stock;
  final bool isFavourite;

  Product({
    required this.id,
    required this.images,
    this.rating = 0.0,
    this.isFavourite = false,
    required this.stock,
    required this.title,
    required this.price,
    required this.description,
  });
}
