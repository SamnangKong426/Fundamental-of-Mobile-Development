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
        body: Padding(
          padding: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 30, bottom: 30, top: 30, right: 20),
                          child: Icon(
                            Icons.travel_explore,
                            color: Colors.white,
                          )),
                      Text(
                        "Travelling",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),  
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: const Center(
                  child: Row(
                    children: [
                      Padding(
                          padding: EdgeInsets.only(
                              left: 30, bottom: 30, top: 30, right: 20),
                          child: Icon(
                            Icons.skateboarding,
                            color: Colors.white,
                          )),
                      Text(
                        "Skating",
                        style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                            decoration: TextDecoration.none),
                      ),  
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