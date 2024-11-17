import '../model/joke_model.dart';

List<JokeData> jokes = [
  for (int i = 0; i < 20; i++)
    JokeData(
        title: 'title $i', description: 'description $i', isFavorite: false)
];
