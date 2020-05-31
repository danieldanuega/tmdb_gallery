// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TmdbStore on _TmdbStore, Store {
  Computed<int> _$reviewsCountComputed;

  @override
  int get reviewsCount =>
      (_$reviewsCountComputed ??= Computed<int>(() => super.reviewsCount,
              name: '_TmdbStore.reviewsCount'))
          .value;
  Computed<int> _$genresCountComputed;

  @override
  int get genresCount =>
      (_$genresCountComputed ??= Computed<int>(() => super.genresCount,
              name: '_TmdbStore.genresCount'))
          .value;
  Computed<int> _$moviesCountComputed;

  @override
  int get moviesCount =>
      (_$moviesCountComputed ??= Computed<int>(() => super.moviesCount,
              name: '_TmdbStore.moviesCount'))
          .value;

  final _$genresAtom = Atom(name: '_TmdbStore.genres');

  @override
  ObservableList<Genre> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(ObservableList<Genre> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  final _$moviesAtom = Atom(name: '_TmdbStore.movies');

  @override
  ObservableList<Movies> get movies {
    _$moviesAtom.reportRead();
    return super.movies;
  }

  @override
  set movies(ObservableList<Movies> value) {
    _$moviesAtom.reportWrite(value, super.movies, () {
      super.movies = value;
    });
  }

  final _$detailMovieAtom = Atom(name: '_TmdbStore.detailMovie');

  @override
  DetailMovie get detailMovie {
    _$detailMovieAtom.reportRead();
    return super.detailMovie;
  }

  @override
  set detailMovie(DetailMovie value) {
    _$detailMovieAtom.reportWrite(value, super.detailMovie, () {
      super.detailMovie = value;
    });
  }

  final _$reviewsAtom = Atom(name: '_TmdbStore.reviews');

  @override
  ObservableList<Review> get reviews {
    _$reviewsAtom.reportRead();
    return super.reviews;
  }

  @override
  set reviews(ObservableList<Review> value) {
    _$reviewsAtom.reportWrite(value, super.reviews, () {
      super.reviews = value;
    });
  }

  final _$getGenresAsyncAction = AsyncAction('_TmdbStore.getGenres');

  @override
  Future<dynamic> getGenres() {
    return _$getGenresAsyncAction.run(() => super.getGenres());
  }

  final _$getMoviesByGenreAsyncAction =
      AsyncAction('_TmdbStore.getMoviesByGenre');

  @override
  Future<dynamic> getMoviesByGenre(int genreId, int page) {
    return _$getMoviesByGenreAsyncAction
        .run(() => super.getMoviesByGenre(genreId, page));
  }

  @override
  String toString() {
    return '''
genres: ${genres},
movies: ${movies},
detailMovie: ${detailMovie},
reviews: ${reviews},
reviewsCount: ${reviewsCount},
genresCount: ${genresCount},
moviesCount: ${moviesCount}
    ''';
  }
}
