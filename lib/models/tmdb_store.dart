import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_gallery/constant.dart';
import 'package:tmdb_gallery/models/genre.dart';
import 'package:tmdb_gallery/models/movies.dart';

part 'tmdb_store.g.dart';

class TmdbStore extends _TmdbStore with _$TmdbStore {}

abstract class _TmdbStore with Store {
  @observable
  ObservableList<Genre> genres = ObservableList<Genre>();

  @observable
  ObservableList movies = ObservableList();

  @computed
  int get genresCount {
    final count = this.genres.length;
    if (count == 0) {
      return 0;
    }
    return count;
  }

  @computed
  int get moviesCount {
    final count = this.movies.length;
    if (count == 0) {
      return 0;
    }
    return count;
  }

  @action
  Future getGenres() async {
    try {
      http.Response response = await http.get(kGenreEndpoint);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        for (var r in res["genres"]) {
          this.genres.add(
                Genre(
                  id: r["id"],
                  name: r["name"],
                ),
              );
        }
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
    }
  }

  @action
  Future getMoviesByGenre(int genreId) async {
    try {
      http.Response response = await http
          .get(kDiscoverMoviesEndpoint + "&page=1&with_genres=$genreId");
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        for (var r in res["results"]) {
          this.movies.add(
                Movies(
                  id: r["id"],
                  title: r["title"],
                  overview: r["overview"],
                ),
              );
        }
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
    }
  }
}
