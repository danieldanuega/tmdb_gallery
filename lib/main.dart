import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tmdb_gallery/models/tmdb_store.dart';
import 'package:tmdb_gallery/screens/home_screen.dart';

void main() {
  runApp(TMDB());
}

class TMDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider<TmdbStore>(
      create: (context) => TmdbStore(),
      child: MaterialApp(
        initialRoute: HomeScreen.id,
        routes: {
          HomeScreen.id: (context) => HomeScreen(),
        },
      ),
    );
  }
}
