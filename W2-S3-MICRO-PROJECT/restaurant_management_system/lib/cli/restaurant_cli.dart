import 'dart:io';
import '../model/menu/menu.dart';
import '../model/order/order.dart';
import '../model/reservation/table_reservation.dart';
import '../service/menu_service.dart';
import '../service/order_service.dart';
import '../service/reservation_service.dart';

class RestaurantCLI {
  final MenuService menuService = MenuService();
  final OrderService orderService = OrderService();
  final ReservationService reservationService = ReservationService();

  void start() {
    print("Welcome to the Restaurant Management System!");
    _seedMenuItems();

    while (true) {
      print("\n--- Main Menu ---");
      print("1. View Menu");
      print("2. Place an Order");
      print("3. Make a Table Reservation");
      print("4. Pay Bill");
      print("5. Exit");
      stdout.write("Choose an option: ");
      String? choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          _viewMenu();
          break;
        case '2':
          _placeOrder();
          break;
        case '3':
          _makeReservation();
          break;
        case '4':
          _payBill();
          break;
        case '5':
          print("Thank you for using the system. Goodbye!");
          exit(0);
        default:
          print("Invalid choice. Please try again.");
      }
    }
  }

  void _viewMenu() {
    print("\n--- Menu ---");
    final items = menuService.getMenuItems();
    if (items.isEmpty) {
      print("No items available in the menu.");
    } else {
      for (var item in items) {
        print("${item.id}. ${item.name} - \$${item.price} (${item.type})");
      }
    }
  }

  void _placeOrder() {
    print("\n--- Place an Order ---");
    final items = menuService.getMenuItems();
    if (items.isEmpty) {
      print("No items available to order.");
      return;
    }

    _viewMenu();

    stdout.write("Enter your name: ");
    String? customerName = stdin.readLineSync();

    Order order = Order(orderService.loadOrderId(), customerName ?? "Guest");

    while (true) {
      stdout.write(
          "Enter item ID to add to your order (or type 'done' to finish): ");
      String? input = stdin.readLineSync();

      if (input == 'done') break;

      int? itemId = int.tryParse(input ?? '');
      if (itemId == null || !items.any((item) => item.id == itemId)) {
        print("Invalid item ID. Please try again.");
        continue;
      }

      final item = items.firstWhere((item) => item.id == itemId);
      order.addItemToOrder(item);
      print("${item.name} added to your order.");
    }

    orderService.createOrder(order);
    print("Order placed successfully! Total Price: \$${order.totalPrice}");
  }

  void _payBill() {
    print("\n--- Pay Bill ---");
    final orders = orderService.getOrders();

    if (orders.isEmpty) {
      print("No orders have been placed yet.");
      return;
    }

    print("Unpaid Orders:");
    for (var order in orders.where((o) => o.paymentStatus == 'Unpaid')) {
      print(
          "Order ID: ${order.id}, Customer: ${order.customer}, Total: \$${order.totalPrice}");
    }

    stdout.write("Enter Order ID to pay: ");
    int? orderId = int.tryParse(stdin.readLineSync() ?? '');

    if (orderId == null ||
        !orders.any((o) => o.id == orderId && o.paymentStatus == 'Unpaid')) {
      print("Invalid Order ID or order is already paid.");
      return;
    }

    final order = orders.firstWhere((o) => o.id == orderId);

    stdout.write(
        "Confirm payment of \$${order.totalPrice} for Order ID ${order.id}? (yes/no): ");
    String? confirmation = stdin.readLineSync();
    
    if (confirmation?.toLowerCase() == 'yes') {
      order.paymentStatus = 'Paid';
      orderService.updateOrder();
      print("Payment successful for Order ID ${order.id}!");
    } else {
      print("Payment canceled.");
    }
  }

  void _makeReservation() {
    reservationService.showAvailableReservations();
    stdout.write("Enter your name: ");
    String? customer = stdin.readLineSync();
    stdout.write("Enter table number: ");
    int tableNumber = int.parse(stdin.readLineSync()!);
    stdout.write("Enter reservation date (yyyy-mm-dd): ");
    DateTime reservationDate = DateTime.parse(stdin.readLineSync()!);

    int reservationId = reservationService.getReservations().length + 1;
    TableReservation reservation = TableReservation(
      id: reservationId,
      customer: customer!,
      tableNumber: tableNumber,
      reservationDate: reservationDate,
    );
    reservationService.createReservation(reservation);
  }

  void _seedMenuItems() {
    menuService.addMenuItem(Menu(id: 1, name: "Pizza", price: 12.99, type: "Food"));
    menuService.addMenuItem(Menu(id: 2, name: "Burger", price: 8.99, type: "Food"));
    menuService.addMenuItem(Menu(id: 3, name: "Coke", price: 1.99, type: "Drink"));
    menuService.addMenuItem(Menu(id: 4, name: "Pasta", price: 10.99, type: "Food"));
    menuService.addMenuItem(Menu(id: 5, name: "Salad", price: 7.99, type: "Food"));
    menuService.addMenuItem(Menu(id: 6, name: "Water", price: 0.99, type: "Drink"));
    menuService.addMenuItem(Menu(id: 7, name: "Steak", price: 19.99, type: "Food"));
    menuService.addMenuItem(Menu(id: 8, name: "Fries", price: 3.99, type: "Food"));
    menuService.addMenuItem(Menu(id: 9, name: "Lemonade", price: 2.99, type: "Drink"));
    menuService.addMenuItem(Menu(id: 10, name: "Ice Cream", price: 4.99, type: "Dessert"));
  }
}
