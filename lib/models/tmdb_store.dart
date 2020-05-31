import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_gallery/constant.dart';
import 'package:tmdb_gallery/models/detailMovie.dart';
import 'package:tmdb_gallery/models/genre.dart';
import 'package:tmdb_gallery/models/movies.dart';
import 'package:tmdb_gallery/models/review.dart';

part 'tmdb_store.g.dart';

class TmdbStore extends _TmdbStore with _$TmdbStore {}

abstract class _TmdbStore with Store {
  @observable
  ObservableList<Genre> genres = ObservableList<Genre>();

  @observable
  ObservableList<Movies> movies = ObservableList<Movies>();

  @observable
  DetailMovie detailMovie;

  @observable
  ObservableList<Review> reviews = ObservableList<Review>();

  @computed
  int get reviewsCount {
    final count = this.reviews.length;
    if (count == 0) {
      return 0;
    }
    return count;
  }

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
  Future getMoviesByGenre(int genreId, int page) async {
    try {
      http.Response response = await http
          .get(kDiscoverMoviesEndpoint + "&page=$page&with_genres=$genreId");
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        for (var r in res["results"]) {
          this.movies.add(
                Movies(
                  id: r["id"],
                  title: r["title"],
                  posterPath: r["poster_path"],
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

  Future getDetailMovie(int movieId) async {
    final endpoint =
        "https://api.themoviedb.org/3/movie/$movieId?api_key=$kApiKey&language=en-US";
    try {
      http.Response response = await http.get(endpoint);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        this.detailMovie = DetailMovie(
          id: res["id"],
          imdbId: res["imdb_id"],
          overview: res["overview"],
          popularity: res["popularity"],
          status: res["status"],
        );
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
    }
  }

  Future getMovieReview(int movieId) async {
    final endpoint =
        "https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=$kApiKey&language=en-US&page=1";
    try {
      http.Response response = await http.get(endpoint);
      if (response.statusCode == 200) {
        final res = jsonDecode(response.body);
        for (var r in res["results"]) {
          this.reviews.add(
                Review(
                  id: r["id"],
                  author: r["author"],
                  content: r["content"],
                  url: r["url"],
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
