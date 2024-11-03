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
            title: const Text("My Hobbies"), backgroundColor: Colors.pink[50]),
        body: const Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HobbyCard(
                  icon: Icons.travel_explore,
                  text: "Travelling",
                  color: Colors.green),
              SizedBox(height: 10),
              HobbyCard(
                  icon: Icons.skateboarding,
                  text: "Skating",
                  color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}

class HobbyCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  const HobbyCard({
    super.key,
    required this.icon,
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Row(
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    left: 30, bottom: 30, top: 30, right: 20),
                child: Icon(
                  icon,
                  color: Colors.white,
                )),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 35.0,
                  color: Colors.white,
                  decoration: TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
