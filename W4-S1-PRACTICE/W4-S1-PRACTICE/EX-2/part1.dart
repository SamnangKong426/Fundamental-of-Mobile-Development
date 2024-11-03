import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final String dart_img = "w4-s1-practice/dart.png";
  final String flutter_img = "w4-s1-practice/flutter.png";
  final String firebase_img = "w4-s1-practice/firebase.png";

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
