import 'package:flutter/material.dart';
import 'model/joke_model.dart';
import 'data/joke_data.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: ListView(
          children: [
            ...getFavoriteCards(),
          ],
        ),
      ),
    ));

bool get isBestJokeAvailable {
  return jokes.any((jokeData) => jokeData.isFavorite);
}

List<Widget> getFavoriteCards() {
  return jokes
      .map((jokeData) => FavoriteCard(
            jokeData: jokeData,
          ))
      .toList();
}

class FavoriteCard extends StatefulWidget {
  const FavoriteCard(
      {super.key, required this.jokeData});

  final JokeData jokeData;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _isFavorite = widget.jokeData.isFavorite;
  }

  void onFavoriteClick() {
    setState(() {
      _isFavorite = !_isFavorite;
      widget.jokeData.isFavorite = _isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.jokeData.title,
                  style:
                      TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(widget.jokeData.description)
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite && isBestJokeAvailable
                    ? Colors.red
                    : Colors.grey,
              ))
        ],
      ),
    );
  }
}
