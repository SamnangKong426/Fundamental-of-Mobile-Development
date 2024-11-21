import '../model/order/order.dart';
import '../repository/order_repository.dart';

class OrderService {
  final List<Order> _orders = [];
  final OrderRepository _orderRepository = OrderRepository();

  void createOrder(Order order) {
    _orders.add(order);
  }

  List<Order> getOrders() {
    return _orders;
  }

  int loadOrderId() {
    return _orderRepository.loadOrderId();
  }

  void updateOrder() {
    int id = loadOrderId();
    _saveOrders(
        "lib/repository/orders/order$id.json");
  }

  void _saveOrders(String filePath) {
    _orderRepository.saveOrders(_orders, filePath);
  }
}
