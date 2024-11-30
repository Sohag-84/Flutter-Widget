import 'package:hive/hive.dart';
part 'wishlist_model.g.dart';

@HiveType(typeId: 0)
class HiveWishlistProduct extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String price;

  @HiveField(3)
  String images;

  @HiveField(4)
  int cartQuantity;

  HiveWishlistProduct({
    required this.id,
    required this.name,
    required this.images,
    required this.price,
    this.cartQuantity = 1,
  });
}
