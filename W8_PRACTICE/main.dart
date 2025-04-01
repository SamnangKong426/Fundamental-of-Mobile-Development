// REPOSITORY
import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'async_value.dart';

// REPOS
abstract class SongRepository {
  Future<Song> addSong({
    required String title,
    required String artist,
    required double duration,
  });
  Future<List<Song>> getSongs();
  Future<void> deleteSong(String id);
  Future<Song> updateSong(Song song);
}

class FirebaseSongRepository extends SongRepository {
  static const String baseUrl =
      'https://blablarcar-9ac2d-default-rtdb.asia-southeast1.firebasedatabase.app/';
  static const String songsCollection = "songs";
  static const String allSongsUrl = '$baseUrl/$songsCollection.json';

  @override
  Future<Song> addSong({
    required String title,
    required String artist,
    required double duration,
  }) async {
    Uri uri = Uri.parse(allSongsUrl);

    // Create a new song data
    final newSongData = {
      'title': title,
      'artist': artist,
      'duration': duration,
    };
    final http.Response response = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(newSongData),
    );

    // Handle errors
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to add song');
    }

    // Firebase returns the new ID in 'name'
    final newId = json.decode(response.body)['name'];

    // Return created user
    return Song(id: newId, title: title, artist: artist, duration: duration);
  }

  @override
  Future<List<Song>> getSongs() async {
    Uri uri = Uri.parse(allSongsUrl);
    final http.Response response = await http.get(uri);

    // Handle errors
    if (response.statusCode != HttpStatus.ok &&
        response.statusCode != HttpStatus.created) {
      throw Exception('Failed to load songs');
    }

    // Return all users
    final data = json.decode(response.body) as Map<String, dynamic>?;
    if (data == null) return [];
    return data.entries
        .map((entry) => SongDto.fromJson(entry.key, entry.value))
        .toList();
  }

  @override
  Future<void> deleteSong(String id) async {
    final Uri uri = Uri.parse('$baseUrl/$songsCollection/$id.json');
    final response = await http.delete(uri);

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to delete song with id $id');
    }
  }

  @override
  Future<Song> updateSong(Song song) async {
    final Uri uri = Uri.parse('$baseUrl/$songsCollection/${song.id}.json');
    final response = await http.put(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: json.encode(SongDto.toJson(song)),
    );

    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to update song with id ${song.id}');
    }

    return SongDto.fromJson(song.id, json.decode(response.body));
  }
}

// MODEL & DTO
class SongDto {
  static Song fromJson(String id, Map<String, dynamic> json) {
    return Song(
      id: id,
      title: json['title'],
      artist: json['artist'],
      duration: json['duration'],
    );
  }

  static Map<String, dynamic> toJson(Song song) {
    return {
      'title': song.title,
      'artist': song.artist,
      'duration': song.duration,
    };
  }
}

// MODEL
class Song {
  final String id;
  final String title;
  final String artist;
  final double duration;

  Song({
    required this.id,
    required this.title,
    required this.artist,
    required this.duration,
  });

  @override
  bool operator ==(Object other) {
    return other is Song && other.id == id;
  }

  @override
  int get hashCode => super.hashCode ^ id.hashCode;
}

// PROVIDER
class SongProvider extends ChangeNotifier {
  final SongRepository _repository;
  AsyncValue<List<Song>>? songsState;

  SongProvider(this._repository) {
    fetchSongs();
  }

  bool get isLoading =>
      songsState != null && songsState!.state == AsyncValueState.loading;
  bool get hasData =>
      songsState != null && songsState!.state == AsyncValueState.success;

  void fetchSongs() async {
    try {
      // 1. loading state
      songsState = AsyncValue.loading();
      notifyListeners();

      // 2. fetch songs
      songsState = AsyncValue.success(await _repository.getSongs());

      print('SUCCESS: list size ${songsState!.data!.length.toString()}');

      // 3. Handle errors
    } catch (error) {
      songsState = AsyncValue.error(error);
    }

    notifyListeners();
  }

  void addSong(String title, String artist, double duration) {
    final newSong = Song(
      id: DateTime.now().toString(),
      title: title,
      artist: artist,
      duration: duration,
    );
    final currentSongs = songsState?.data ?? [];
    songsState = AsyncValue.success([...currentSongs, newSong]);
    notifyListeners();

    _repository
        .addSong(title: title, artist: artist, duration: duration)
        .then((addedSong) {
          final updatedSongs =
              songsState!.data!.map((song) {
                return song.id == newSong.id ? addedSong : song;
              }).toList();
          songsState = AsyncValue.success(updatedSongs);
          notifyListeners();
        })
        .catchError((error) {
          songsState = AsyncValue.success(currentSongs);
          notifyListeners();
          print('Error adding song: $error');
        });
  }

  void deleteSong(String id) {
    final currentSongs = songsState?.data ?? [];
    final updatedSongs = currentSongs.where((song) => song.id != id).toList();
    songsState = AsyncValue.success(updatedSongs);
    notifyListeners();

    _repository.deleteSong(id).catchError((error) {
      songsState = AsyncValue.success(currentSongs);
      notifyListeners();
      print('Error deleting song: $error');
    });
  }

  void updateSong(Song updatedSong) {
    final currentSongs = songsState?.data ?? [];
    final updatedSongs =
        currentSongs.map((song) {
          return song.id == updatedSong.id ? updatedSong : song;
        }).toList();
    songsState = AsyncValue.success(updatedSongs);
    notifyListeners();

    _repository.updateSong(updatedSong).catchError((error) {
      songsState = AsyncValue.success(currentSongs);
      notifyListeners();
      print('Error updating song: $error');
    });
  }
}

// FORM WIDGET FOR ADDING/EDITING SONGS
class SongForm extends StatefulWidget {
  final Song? song;
  final Function(String title, String artist, double duration) onSubmit;

  const SongForm({Key? key, this.song, required this.onSubmit})
    : super(key: key);

  @override
  _SongFormState createState() => _SongFormState();
}

class _SongFormState extends State<SongForm> {
  final _formKey = GlobalKey<FormState>();
  late String _title;
  late String _artist;
  late double _duration;

  @override
  void initState() {
    super.initState();
    _title = widget.song?.title ?? '';
    _artist = widget.song?.artist ?? '';
    _duration = widget.song?.duration ?? 0.0;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.song == null ? 'Add Song' : 'Edit Song'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              initialValue: _title,
              decoration: InputDecoration(labelText: 'Title'),
              onSaved: (value) => _title = value!,
              validator: (value) => value!.isEmpty ? 'Title is required' : null,
            ),
            TextFormField(
              initialValue: _artist,
              decoration: InputDecoration(labelText: 'Artist'),
              onSaved: (value) => _artist = value!,
              validator:
                  (value) => value!.isEmpty ? 'Artist is required' : null,
            ),
            TextFormField(
              initialValue: _duration.toString(),
              decoration: InputDecoration(labelText: 'Duration (minutes)'),
              keyboardType: TextInputType.number,
              onSaved: (value) => _duration = double.parse(value!),
              validator:
                  (value) => value!.isEmpty ? 'Duration is required' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              widget.onSubmit(_title, _artist, _duration);
              Navigator.of(context).pop();
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

// MAIN APP
class App extends StatelessWidget {
  const App({super.key});

  void _onAddPressed(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => SongForm(
            onSubmit: (title, artist, duration) {
              final songProvider = context.read<SongProvider>();
              songProvider.addSong(title, artist, duration);
            },
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final songProvider = Provider.of<SongProvider>(context);

    Widget content = Text('');
    if (songProvider.isLoading) {
      content = CircularProgressIndicator();
    } else if (songProvider.hasData) {
      List<Song> songs = songProvider.songsState!.data!;

      if (songs.isEmpty) {
        content = Text("No songs yet");
      } else {
        content = ListView.builder(
          itemCount: songs.length,
          itemBuilder:
              (context, index) => ListTile(
                title: Text(songs[index].title),
                subtitle: Text(
                  "${songs[index].artist} - ${songs[index].duration} min",
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      onPressed: () {
                        _onUpdateSong(context, songs, index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.red),
                      onPressed: () {
                        _onDeleteSong(context, songs, index);
                      },
                    ),
                  ],
                ),
              ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            onPressed: () => _onAddPressed(context),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Center(child: content),
    );
  }

  void _onDeleteSong(BuildContext context, List<Song> songs, int index) {
    final songProvider = context.read<SongProvider>();
    songProvider.deleteSong(songs[index].id);
  }

  Future<dynamic> _onUpdateSong(
    BuildContext context,
    List<Song> songs,
    int index,
  ) {
    return showDialog(
      context: context,
      builder:
          (context) => SongForm(
            song: songs[index],
            onSubmit: (title, artist, duration) {
              final songProvider = context.read<SongProvider>();
              songProvider.updateSong(
                Song(
                  id: songs[index].id,
                  title: title,
                  artist: artist,
                  duration: duration,
                ),
              );
            },
          ),
    );
  }
}

// 5 - MAIN
void main() async {
  // 1 - Create repository
  final SongRepository songRepository = FirebaseSongRepository();

  // 2 - Run app
  runApp(
    ChangeNotifierProvider(
      create: (context) => SongProvider(songRepository),
      child: MaterialApp(debugShowCheckedModeBanner: false, home: const App()),
    ),
  );
}
