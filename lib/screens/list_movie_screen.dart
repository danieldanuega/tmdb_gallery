import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_gallery/constant.dart';
import 'package:tmdb_gallery/models/tmdb_store.dart';
import 'package:tmdb_gallery/screens/detail_movie_screen.dart';
import 'package:tmdb_gallery/widgets/movie_tile_widget.dart';
import 'package:tmdb_gallery/widgets/title_text_widget.dart';

class ListMovie extends StatefulWidget {
  final String title;
  static final id = "list_movie";

  ListMovie({this.title});

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
    final ListMovie args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TitleText(title: args.title),
            Divider(
              height: 30.0,
            ),
            Flexible(
              child: ListView.separated(
                padding: EdgeInsets.only(left: 30.0),
                scrollDirection: Axis.horizontal,
                itemCount: _tmdbStore.moviesCount,
                itemBuilder: (context, index) {
                  var id = _tmdbStore.movies[index].id;
                  var title = _tmdbStore.movies[index].title;
                  var posterPath = _tmdbStore.movies[index].posterPath;
                  return MovieTile(
                    onTap: () async {
                      await _tmdbStore.getDetailMovie(id);
                      await _tmdbStore.getMovieReview(id);
                      Navigator.of(context).pushNamed(
                        DetailMovieScreen.id,
                        arguments: DetailMovieScreen(movieTitle: title),
                      );
                    },
                    posterPath: posterPath,
                    title: title,
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(width: 30.0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
