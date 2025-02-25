bool matchingPair(String input) {
  final matchingPairs = {
    '(': ')',
    '{': '}',
    '[': ']',
  };

  List<String> stack = [];

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    if (matchingPairs.containsKey(char)) {
      stack.add(char);
    } else if (matchingPairs.containsValue(char)) {
      if (stack.isEmpty || matchingPairs[stack.last] != char) {
        return false;
      } else {
        stack.removeLast();
      }
    }
  }

  return true;
}

void main() {
  String input = "{[[(a)b]c]d}";

  if (matchingPair(input)) {
    print("Balanced");
  } else {
    print("Not Balanced");
  }
}
