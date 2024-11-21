class Menu {
  final int id;
  final String name;
  final double price;
  final String type;

  Menu({
    required this.id,
    required this.name,
    required this.price,
    required this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'type': type,
    };
  }
}
