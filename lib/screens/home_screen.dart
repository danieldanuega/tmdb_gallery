import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_gallery/models/tmdb_store.dart';
import 'package:tmdb_gallery/widgets/oval_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  static final String id = "home_screen";
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Shader linearGradient =
      LinearGradient(colors: [Colors.green, Colors.lightBlue])
          .createShader(Rect.fromLTWH(0.0, 0.0, 300.0, 70.0));
  TmdbStore _tmdbStore;
  bool isLoaded = false;

  void loadGenres() async {
    _tmdbStore ??= Provider.of<TmdbStore>(context, listen: false);
    await _tmdbStore.getGenres();
    setState(() {
      isLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    loadGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF032541),
        title: Text(
          "TMDB Gallery",
          style: GoogleFonts.montserrat(
              foreground: Paint()..shader = linearGradient,
              fontWeight: FontWeight.bold,
              fontSize: 28.0),
        ),
      ),
      body: isLoaded
          ? Observer(
              builder: (_) => _tmdbStore.genresCount == 0
                  ? Center(
                      child: Text("TMDB"),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.all(40.0),
                      itemCount: _tmdbStore.genresCount,
                      itemBuilder: (context, index) {
                        return OvalContainer(
                          onPressed: () {},
                          text: _tmdbStore.genres[index],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 20.0);
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
