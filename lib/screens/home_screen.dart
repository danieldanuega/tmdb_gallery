import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_gallery/constant.dart';
import 'package:tmdb_gallery/models/tmdb_store.dart';
import 'package:tmdb_gallery/screens/list_movie_screen.dart';
import 'package:tmdb_gallery/widgets/oval_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Shader _linearGradient =
      LinearGradient(colors: [Colors.green, Colors.lightBlue])
          .createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));
  TmdbStore _tmdbStore;
  bool _isLoaded = false;

  void _loadGenres() async {
    _tmdbStore ??= Provider.of<TmdbStore>(context, listen: false);
    await _tmdbStore.getGenres();
    setState(() {
      _isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColorAppBar,
        title: Text(
          "TMDB Gallery",
          style: GoogleFonts.montserrat(
              foreground: Paint()..shader = _linearGradient,
              fontWeight: FontWeight.bold,
              fontSize: 28.0),
        ),
      ),
      body: _isLoaded
          ? Observer(
              builder: (_) => _tmdbStore.genresCount == 0
                  ? Center(
                      child: Text("NO DATA"),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.all(40.0),
                      itemCount: _tmdbStore.genresCount,
                      itemBuilder: (context, index) {
                        return OvalContainer(
                          text: _tmdbStore.genres[index].name,
                          onPressed: () {
                            _tmdbStore.movies.clear();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ListMovie(
                                genreName: _tmdbStore.genres[index].name,
                                genreId: _tmdbStore.genres[index].id,
                              ),
                            ));
                          },
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 30.0);
                      },
                    ),
            )
          : SpinKitFoldingCube(
              color: Colors.cyan,
              size: 50.0,
            ),
    );
  }
}
