import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_gallery/models/detailMovie.dart';
import 'package:tmdb_gallery/models/tmdb_store.dart';
import 'package:tmdb_gallery/widgets/detail_atribute_widget.dart';
import 'package:tmdb_gallery/widgets/review_tile_widget.dart';
import 'package:tmdb_gallery/widgets/title_text_widget.dart';

class DetailMovieScreen extends StatefulWidget {
  final String movieTitle;

  DetailMovieScreen({Key key, this.movieTitle});

  @override
  _DetailMovieScreenState createState() => _DetailMovieScreenState();
}

class _DetailMovieScreenState extends State<DetailMovieScreen> {
  TmdbStore _tmdbStore;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _tmdbStore ??= Provider.of<TmdbStore>(context);
  }

  @override
  Widget build(BuildContext context) {
    final DetailMovie _detailMovie = _tmdbStore.detailMovie;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TitleText(title: widget.movieTitle),
            Flexible(
              child: Container(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(
                      flex: 3,
                      child: DetailAtribute(
                        attr: "Overview",
                        value: _detailMovie.overview,
                      ),
                    ),
                    Divider(),
                    Flexible(
                      child: DetailAtribute(
                          attr: "Popularity",
                          value: _detailMovie.popularity ??
                              "Haven't been reviewed yet"),
                    ),
                    Divider(),
                    Flexible(
                        child: DetailAtribute(
                            attr: "IMDB ID",
                            value: _detailMovie.imdbId ?? "No IMDB ID yet")),
                    Divider(),
                    Flexible(
                        child: DetailAtribute(
                            attr: "Status", value: _detailMovie.status)),
                    Flexible(
                      child: _tmdbStore.reviewsCount == 0
                          ? Center(
                              child: Text("There are no review yet . . .",
                                  style: GoogleFonts.roboto(fontSize: 20.0)))
                          : ListView.builder(
                              itemCount: _tmdbStore.reviewsCount,
                              itemBuilder: (context, index) {
                                return ReviewTile(
                                  author: _tmdbStore.reviews[index].author,
                                  content: _tmdbStore.reviews[index].content,
                                );
                              }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
