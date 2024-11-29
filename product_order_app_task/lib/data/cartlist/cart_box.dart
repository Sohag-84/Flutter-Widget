import 'package:hive/hive.dart';
import 'package:product_order_app_task/data/cartlist/cartlist_model.dart';

class CartBoxes {
  static Box<HiveCartlistProduct> getData() =>
      Hive.box<HiveCartlistProduct>("cart");
}
