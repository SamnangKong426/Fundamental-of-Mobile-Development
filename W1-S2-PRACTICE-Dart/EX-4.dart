void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  // Write a program to calculate the total for a given order.
  double totalPrices = 0;
  for (int i = 0; i < order.length; i++) {
    if (pizzaPrices.containsKey(order[i])) {
      totalPrices += pizzaPrices[order[i]]!;
    } else {
      print("${order[i]} was not found in pizza prices");
    }
  }

  print("Total price: \$${totalPrices}");
}
