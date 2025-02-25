// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);

  @override
  String toString() {
    return "Tree type: $type, height: $height";
  }
}

enum Country {
  Cambodia, USA, France, UAE
}

enum City {
  Phnom_Penh, California, Paris, Abu_Dhabi
}

class Address {
  final Country country;
  final String street;
  final City city;

  Address({required this.country, required this.street, required this.city});

  @override
  String toString() {
    return "$country, $street, $city";
  }
}

// Class House
class House {
  Address address;
  List<Tree> trees = []; // by default empty
  String doorPositon;
  int totalWindow;
  String windowColor;
  int totalChimney;
  int totalRoof;
  int totalRooms;
  bool isWindowOpen = false;

  // Constructor with named parameters
  House(this.address, this.doorPositon, this.totalWindow, this.windowColor,
      this.totalChimney, this.totalRoof, this.totalRooms);

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  void openWindow() {
    print("Window is now open!");
    this.isWindowOpen = true;
  }

  void closeWindow() {
    print("Window is now close!");
    this.isWindowOpen = false;
  }

  @override
  String toString() {
    return "House address: $address, door position: $doorPositon, total window: $totalWindow, window color: $windowColor, total chimney: $totalChimney, total roof: $totalRoof, total rooms: $totalRooms, trees: $trees";
  }
}

void main() {
  // This is just an example
  Address myHouseAddress = new Address(country: Country.Cambodia, street: "7 makara", city: City.Phnom_Penh);
  House myHouse = House(myHouseAddress, "center", 5, "Blue", 1, 1, 5);
  myHouse.addTree(new Tree("X-mas tree", 2));
  myHouse.openWindow();
  print(myHouse);


  House neighbourHouse = House(new Address(country: Country.USA, street: "Long Beach", city: City.California), "Left", 10, "Red", 0, 0, 5);
  neighbourHouse.addTree(new Tree("Palm", 4));
  print(neighbourHouse.toString());
}
