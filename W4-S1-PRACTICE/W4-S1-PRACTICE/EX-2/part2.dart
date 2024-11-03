import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
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

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Products"), backgroundColor: Colors.pink[50]),
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(dart_img, width: 100,),
                      const Text("Dart", style: TextStyle(fontSize: 30)),
                      const Text(
                          "the best object language"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(flutter_img, width: 100,),
                      const Text("Flutter", style: TextStyle(fontSize: 30)),
                      const Text(
                          "the best mobile widget library"),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(firebase_img, width: 100,),
                      const Text("Firebase", style: TextStyle(fontSize: 30)),
                      const Text(
                          "the best cloud database"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
