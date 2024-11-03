import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Products"), backgroundColor: Colors.pink[50]),
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ProductCard(product: Product.Dart),
              ProductCard(product: Product.Flutter),
              ProductCard(product: Product.Firebase),
            ],
          ),
        ),
      ),
    );
  }
}

const String dart_img = "w4-s1-practice/dart.png";
const String flutter_img = "w4-s1-practice/flutter.png";
const String firebase_img = "w4-s1-practice/firebase.png";

enum Product {
  Dart("Dart", "the best object language", dart_img),
  Flutter("Flutter", "the best mobile widget library", flutter_img),
  Firebase("Firebase", "the best cloud database", firebase_img);

  final String name;
  final String description;
  final String image;

  const Product(this.name, this.description, this.image);
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              product.image,
              width: 100,
            ),
            Text(product.name, style: const TextStyle(fontSize: 30)),
            Text(product.description),
          ],
        ),
      ),
    );
  }
}
