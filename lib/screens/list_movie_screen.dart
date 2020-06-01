import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_gallery/constant.dart';
import 'package:tmdb_gallery/models/tmdb_store.dart';
import 'package:tmdb_gallery/screens/detail_movie_screen.dart';
import 'package:tmdb_gallery/widgets/movie_tile_widget.dart';
import 'package:tmdb_gallery/widgets/title_text_widget.dart';

class ListMovie extends StatefulWidget {
  final String genreName;
  final int genreId;

  ListMovie({this.genreName, this.genreId});

  @override
  _ListMovieState createState() => _ListMovieState();
}

class _ListMovieState extends State<ListMovie> {
  TmdbStore _tmdbStore;
  ScrollController _scrollController = ScrollController();
  int _page = 1;

  @override
  void initState() {
    super.initState();
    _tmdbStore ??= Provider.of<TmdbStore>(context, listen: false);
    print(widget.genreId);
    print(_page);
    _tmdbStore.getMoviesByGenre(widget.genreId, _page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print("Get more data");
        setState(() {
          _page++;
        });
        print(_page);
        _tmdbStore.getMoviesByGenre(widget.genreId, _page);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tmdbStore ??= Provider.of<TmdbStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TitleText(title: widget.genreName),
            Divider(
              height: 30.0,
            ),
            Flexible(
              child: Observer(
                builder: (_) => ListView.separated(
                  padding: EdgeInsets.only(left: 30.0),
                  controller: _scrollController,
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailMovieScreen(movieTitle: title),
                          ),
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
            ),
          ],
        ),
      ),
    );
  }
}
