import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_gallery/constant.dart';
import 'package:tmdb_gallery/models/tmdb_store.dart';

class ListMovie extends StatefulWidget {
  static final id = "list_movie";
  @override
  _ListMovieState createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  TmdbStore _tmdbStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tmdbStore ??= Provider.of<TmdbStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorAppBar,
        automaticallyImplyLeading: true,
      ),
      body: ListView.builder(
        itemCount: _tmdbStore.moviesCount,
        itemBuilder: (context, index) {
          return Text(_tmdbStore.movies[index].title);
        },
      ),
    );
  }
}
