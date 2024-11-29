import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:product_order_app_task/common/const.dart';
import 'package:product_order_app_task/data/cartlist/cart_box.dart';
import 'package:product_order_app_task/data/cartlist/cartlist_model.dart';
import 'package:product_order_app_task/data/local_preference.dart';
import 'package:product_order_app_task/models/order_model.dart';
import 'package:product_order_app_task/models/product.dart';
import 'package:product_order_app_task/modules/home/view/home_view.dart';
import 'package:uuid/uuid.dart';

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

  ///delete specific cart item
  void deleteCartItem({required HiveCartlistProduct product}) async {
    await product.delete();
    update();
  }

  ///delete full cart list
  void deleteCartList() async {
    await box.clear();
    update();
  }

  /// save order to Firebase under a specific user
  Future<void> orderPlaced() async {
    EasyLoading.show(status: "Loading....");
    try {
      final userId = LocalPreferenceService.instance.getToken();

      // Create order details
      final orderItems = box.values.map((product) {
        return {
          'id': product.id,
          'name': product.name,
          'price': product.price,
          'quantity': product.cartQuantity,
          'image': product.img,
        };
      }).toList();

      final order = Order(
        ///id->order id
        id: const Uuid().v4().substring(0, 10),
        items: orderItems,
        totalPrice: totalPrice(),
        orderDate: DateTime.now(),
        orderStatus: "pending",
      );

      // Save the order under the user's document
      await firestore
          .collection('users')
          .doc(userId)
          .collection('orders')
          .doc(order.id)
          .set(order.toJson());

      // Clear the cart after order placement
      deleteCartList();

      Fluttertoast.showToast(msg: "Order placed successfully!");
      Get.offAll(() => const HomeView());
    } catch (e) {
      Fluttertoast.showToast(msg: "Failed to place order: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }
}
