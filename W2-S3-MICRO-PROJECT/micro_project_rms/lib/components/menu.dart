import 'dart:io';
import 'dart:convert';
import 'package:pretty_json/pretty_json.dart';

/*  
This class is responsible for managing the menu items by admin
User can only view the menu items
*/

class Menu {
  int? _menu_id;
  Map<String, double>? _items;
  final file = File("lib/database/menu.json");

  Menu() {
    readMenuJson();
  }

  void readMenuJson() {
    // print("[MENU] Reading menu from JSON file");
    var contents = file.readAsStringSync();
    var jsonData = jsonDecode(contents);
    _menu_id = jsonData['menu_id'];
    _items = Map<String, double>.from(jsonData['items']);
  }

  void writeMenuJson() {
    // print("[MENU] Writing menu to JSON file");
    var jsonData = {
      'menu_id': _menu_id,
      'items': _items,
    };
    // var jsonString = jsonEncode(jsonData);
    var jsonString = prettyJson(jsonData, indent: 2);
    file.writeAsStringSync(jsonString);
  }

  Map<String, double>? get items => _items;

  void displayMenu() {
    readMenuJson();
    print('Menu ID: $_menu_id');
    print('Items:');
    
    for (int i = 0; i < _items!.length; i++) {
      print('\t${i + 1}. ${_items!.keys.elementAt(i)} - \$${_items!.values.elementAt(i)}');
    }
  }
}
