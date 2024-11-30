import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/data/wishlist/wishlist_box.dart';
import 'package:product_order_app_task/data/wishlist/wishlist_model.dart';
import 'package:product_order_app_task/models/product.dart';

class ProfileController extends GetxController {
  final box = WishlistBox.getData();

  ///add to cart
  void addToWishlist({required Product product}) {
    final existingIndex = box.values.toList().indexWhere(
          (item) => item.id == product.id,
        );
    if (existingIndex != -1) {
      deleteWishlistItem(productId: product.id);
    } else {
      final data = HiveWishlistProduct(
        id: product.id,
        name: product.name,
        images: product.images,
        price: product.price.toString(),
      );
      box.add(data);
      data.save();
      Fluttertoast.showToast(msg: "Add to Favorite");
    }
    update();
  }

  void deleteWishlistItem({required final int productId}) async {
    final existingIndex = box.values.toList().indexWhere(
          (item) => item.id == productId,
        );
    if (existingIndex != -1) {
      await box.deleteAt(existingIndex);
      update();
    }
  }
}
