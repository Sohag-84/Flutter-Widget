import 'package:hive/hive.dart';
import 'package:product_order_app_task/data/wishlist/wishlist_model.dart';

class WishlistBox {
  static Box<HiveWishlistProduct> getData() =>
      Hive.box<HiveWishlistProduct>("wishlist");
}
