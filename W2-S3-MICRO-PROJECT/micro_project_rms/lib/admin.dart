import 'dart:convert';
import 'dart:io';
import 'components/menu.dart';

void main() {
  startApp();
}

void startApp() {
  print('======= Welcome to our restaurant! =======');
  print("Please select the menu you'd like to order:");

  while (true) {
    print("1. Display history");
    print("2. Display menu");
    print("3. Add a new menu item");
    print("4. Remove a menu item");
    print("5. Calculate total sales per day");
    print("0. Exit");
    stdout.write("Enter your choice: ");
    final choice = int.parse(stdin.readLineSync()!);
    print("=====================================================");
    switch (choice) {
      case 1:
        displayHistory();
        break;
      case 2:
        displayMenu();
        break;
      case 3:
        addNewMenuItem();
        break;
      case 4:
        removeMenuItem();
        break;
      case 5:
        calculateTotalPricePerDay();
        break;
      case 0:
        print('Thank you for using our restaurant management system!');
        exit(0);
      default:
        print('Invalid choice');
    }
    print("=====================================================");
  }
}

void calculateTotalPricePerDay() {
  stdout.write(
      "Enter the date you want to calculate the total sales for (yyyy-mm-dd): ");
  final date = stdin.readLineSync();
  var totalSales = 0.0;
  for (var file in Directory("lib/database/orders").listSync()) {
    if (file is File) {
      var contents = file.readAsStringSync();
      var jsonData = jsonDecode(contents);
      if (jsonData['date'].toString().contains(date!)) {
        totalSales += jsonData['total_price'];
      }
    }
  }
  print("Total sales on $date: $totalSales");
}

void displayMenu() {
  final menu = Menu();
  menu.displayMenu();
}

void displayHistory() {
  print("Order history:");
  for (var file in Directory("lib/database/orders/").listSync()) {
    if (file is File) {
      var contents = file.readAsStringSync();
      var jsonData = jsonDecode(contents);
      print("Order ID: ${jsonData['order']}");
      print("Date: ${jsonData['date']}");
      print("Items:");
      for (var item in jsonData['items']) {
        print("\t$item");
      }
      print("payment method ${jsonData["payment_method"]}");
      print("Total price: ${jsonData['total_price']}");
      print("=====================================================");
    }
  }
}

void addNewMenuItem() {
  stdout.write("Enter the name of the new menu item: ");
  final name = stdin.readLineSync();
  stdout.write("Enter the price of the new menu item: ");
  final price = double.parse(stdin.readLineSync()!);

  final menu = Menu();
  menu.items![name!] = price;
  menu.writeMenuJson();
}

void removeMenuItem() {
  stdout.write("Enter the name of the menu item you want to remove: ");
  final name = stdin.readLineSync();

  final menu = Menu();
  menu.items!.remove(name);
  menu.writeMenuJson();
}
