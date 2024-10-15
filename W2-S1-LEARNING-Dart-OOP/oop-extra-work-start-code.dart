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

// Class House
class House {
  String address;
  List<Tree> trees = []; // by default empty
  String doorPositon;
  int totalWindow;
  String widowColor;
  int totalChimney;
  int totalRoof;
  int totalRooms;

  // Constructor with named parameters
  House(this.address, this.doorPositon, this.totalWindow, this.widowColor,
      this.totalChimney, this.totalRoof, this.totalRooms);

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  @override
  String toString() {
    return "House address: $address, door position: $doorPositon, total window: $totalWindow, window color: $widowColor, total chimney: $totalChimney, total roof: $totalRoof, total rooms: $totalRooms, trees: $trees";
  }
}

void main() {
  // This is just an example
  House myHouse = House("New York", "center", 5, "Blue", 1, 1, 5);
  myHouse.addTree(new Tree("X-mas tree", 2));
  print(myHouse);

  House neighbourHouse = House("New York", "Left", 10, "Red", 0, 0, 5);
  neighbourHouse.addTree(new Tree("Palm", 4));
  print(neighbourHouse.toString());
}
