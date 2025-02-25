import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            const Expanded(child: ScoreCard(bgLinearProgressIndicator: Colors.green)),
            Expanded(child: ScoreCard(bgLinearProgressIndicator: Colors.green.shade300)),
            Expanded(child: ScoreCard(bgLinearProgressIndicator: Colors.green.shade800)),
          ],
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {

  final Color bgLinearProgressIndicator;

  const ScoreCard({super.key, required this.bgLinearProgressIndicator});

  @override
  _ScoreCardState createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  double score = 0.5; // Initialize score from 0.0 to 1.0

  void incrementScore() {
    setState(() {
      if (score < 1.0) {
        score += 0.1;
      }
    });
  }

  void decrementScore() {
    setState(() {
      if (score > 0.0) {
        score -= 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const Text(
                  'My score in Flutter',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: decrementScore,
                      color: Colors.black,
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: incrementScore,
                      color: Colors.black,
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: score,
                      backgroundColor: Colors.white,
                      color: widget.bgLinearProgressIndicator,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
