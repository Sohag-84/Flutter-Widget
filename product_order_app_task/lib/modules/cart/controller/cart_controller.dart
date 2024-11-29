import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/data/cartlist/cart_box.dart';
import 'package:product_order_app_task/data/cartlist/cartlist_model.dart';
import 'package:product_order_app_task/models/product.dart';

class CartController extends GetxController {
  final box = CartBoxes.getData();

  ///add to cart
  void addToCart({required Product product}) {
    final existingIndex = box.values.toList().indexWhere(
          (item) => item.id == product.id,
        );
    if (existingIndex != -1) {
      Fluttertoast.showToast(msg: "Already added");
    } else {
      final data = HiveCartlistProduct(
        id: product.id,
        name: product.name,
        img: product.images,
        price: product.price.toString(),
      );
      box.add(data);
      data.save();

      Fluttertoast.showToast(msg: "Add to cart");
    }
    update();
  }

  ///increase cart quantity
  increaseQuantity({required int id}) async {
    for (int i = 0; i < box.length; i++) {
      if (box.getAt(i)!.id == id) {
        box.getAt(i)!.cartQuantity += 1;

        ///update quantity in database
        final updateQuantity = box.getAt(i);
        updateQuantity!.cartQuantity = box.getAt(i)!.cartQuantity;
        updateQuantity.save();
      }
    }
    update();
  }

  ///decrease cart quantity
  decreaseQuantity({required int id}) {
    for (int i = 0; i < box.length; i++) {
      final product = box.getAt(i);
      if (product!.id == id) {
        if (product.cartQuantity > 1) {
          product.cartQuantity -= 1;

          ///update quantity in database
          final updateQuantity = box.getAt(i);
          updateQuantity!.cartQuantity = box.getAt(i)!.cartQuantity;
          updateQuantity.save();
        }
      }
    }
    update();
  }

  ///calculate total price
  double totalPrice() {
    double total = 0.0;
    for (int i = 0; i < box.length; i++) {
      final product = box.getAt(i);
      total += double.parse(product!.price) * product.cartQuantity;
    }

    return total;
  }

  void deleteCartItem({required HiveCartlistProduct product}) async {
    await product.delete();
    update();
  }

  void deleteCartList() async {
    await box.clear();
    update();
  }
}
