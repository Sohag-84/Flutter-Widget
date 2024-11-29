import 'package:product_order_app_task/common/const.dart';
import 'package:product_order_app_task/data/local_preference.dart';
import 'package:product_order_app_task/models/order_model.dart';

Future<List<Order>> fetchUserOrders() async {
  try {
    final querySnapshot = await firestore
        .collection('users')
        .doc(LocalPreferenceService.instance.getToken())
        .collection('orders')
        .get();
    return querySnapshot.docs.map((doc) {
      final data = doc.data();
      return Order(
        id: data['id'],
        items: List<Map<String, dynamic>>.from(data['items']),
        totalPrice: data['totalPrice'],
        orderStatus: data['orderStatus'],
        orderDate: DateTime.parse(data['orderDate']),
      );
    }).toList();
  } catch (e) {
    throw Exception("Failed to fetch orders: $e");
  }
}
