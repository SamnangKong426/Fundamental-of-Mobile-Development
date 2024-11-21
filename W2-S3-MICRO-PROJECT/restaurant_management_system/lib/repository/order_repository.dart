import 'dart:convert';
import 'dart:io';
import '../model/order/order.dart';

class OrderRepository {
  int loadOrderId() {
    final file = File("lib/repository/orders/order_id.json");
    if (file.existsSync()) {
      var contents = file.readAsStringSync();
      var jsonData = jsonDecode(contents);
      int id = jsonData['order_id'];
      return id;
    }
    return 0;
  }

  void saveOrderId(String filePath) {
    Map<String, dynamic> jsonData = {'order_id': loadOrderId() + 1};
    String jsonString = jsonEncode(jsonData);
    File file = File(filePath);
    file.writeAsStringSync(jsonString);
  }

  void saveOrders(List<Order> orders, String filePath) {
    var lastJsonList = orders[orders.length - 1].toJson();
    String jsonString = jsonEncode(lastJsonList);
    File file = File(filePath);
    file.writeAsStringSync(jsonString);
    saveOrderId("lib/repository/orders/order_id.json");
  }
}
