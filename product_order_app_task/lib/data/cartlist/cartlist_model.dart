import 'package:hive/hive.dart';
part 'cartlist_model.g.dart';

@HiveType(typeId: 1)
class HiveCartlistProduct extends HiveObject {
  @HiveField(0)
  int id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String price;

  @HiveField(3)
  String img;

  @HiveField(4)
  int cartQuantity;

  HiveCartlistProduct({
    required this.id,
    required this.name,
    required this.img,
    required this.price,
    this.cartQuantity = 1,
  });
}
