import 'dart:convert';
import 'dart:io';
import '../model/menu/menu.dart';


class MenuService {
  final List<Menu> _menuItems = [];

  void addMenuItem(Menu item) {
    _menuItems.add(item);
  }

  List<Menu> getMenuItems() {
    return _menuItems;
  }

  void saveMenuItems(String filePath) {
    List<Map<String, dynamic>> jsonList = _menuItems.map((item) => item.toJson()).toList();
    String jsonString = jsonEncode(jsonList);
    File file = File(filePath);
    file.writeAsStringSync(jsonString);
  }
}
