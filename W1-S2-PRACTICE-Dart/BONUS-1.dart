enum Direction { north, east, south, west }
 
void main() {
  // Initial position {7, 3} and facing north
  int x = 7;
  int y = 3;
  Direction direction = Direction.north;

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions and get the final position and direction
  final leftTurn = {
    Direction.north: Direction.west,
    Direction.east: Direction.north,
    Direction.south: Direction.east,
    Direction.west: Direction.south,
  };

  final rightTurn = {
    Direction.north: Direction.east,
    Direction.east: Direction.south,
    Direction.south: Direction.west,
    Direction.west: Direction.north,
  };

  for (int i = 0; i < instructions.length; i++) {
    if (instructions[i] == "L") {
      direction = leftTurn[direction]!;
    } else if (instructions[i] == "R") {
      direction = rightTurn[direction]!;
    }

    if (instructions[i] == "A") {
      switch (direction) {
        case Direction.north:
          y += 1;
          break;
        case Direction.east:
          x += 1;
          break;
        case Direction.south:
          y -= 1;
          break;
        case Direction.west:
          x -= 1;
          break;
      }
    }
  }

  // Print the final position and direction
  print("Final position:  {$x, $y}"); // Output: {9, 4}
  print("Facing:   ${direction.name}"); // Output: west
}
