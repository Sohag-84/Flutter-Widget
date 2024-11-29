class Order {
  final String id;
  final List<Map<String, dynamic>> items;
  final double totalPrice;
  final DateTime orderDate;
  final String orderStatus;

  Order({
    required this.id,
    required this.items,
    required this.totalPrice,
    required this.orderDate,
    required this.orderStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'items': items,
      'totalPrice': totalPrice,
      'orderDate': orderDate.toIso8601String(),
      'orderStatus': orderStatus,
    };
  }
}
