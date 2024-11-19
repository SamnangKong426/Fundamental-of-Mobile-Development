import 'package:flutter/material.dart';
import 'model/joke_model.dart';
import 'data/joke_data.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(
      home: FavoriteJokesApp(),
    ));

class FavoriteJokesApp extends StatefulWidget {
  @override
  State<FavoriteJokesApp> createState() => _FavoriteJokesAppState();
}

class _FavoriteJokesAppState extends State<FavoriteJokesApp> {
  int? _favoriteIndex;

  void _updateFavorite(int index) {
    setState(() {
      _favoriteIndex = index;
      // Update jokes' favorite status
      for (int i = 0; i < jokes.length; i++) {
        jokes[i].isFavorite = (i == _favoriteIndex);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            jokeData: jokes[index],
            isFavorite: _favoriteIndex == index,
            onFavoriteClick: () => _updateFavorite(index),
          );
        },
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard({
    super.key,
    required this.jokeData,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  final JokeData jokeData;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

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
                  jokeData.title,
                  style: TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(jokeData.description)
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
