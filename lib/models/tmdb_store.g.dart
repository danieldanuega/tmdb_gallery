// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tmdb_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TmdbStore on _TmdbStore, Store {
  Computed<int> _$genresCountComputed;

  @override
  int get genresCount =>
      (_$genresCountComputed ??= Computed<int>(() => super.genresCount,
              name: '_TmdbStore.genresCount'))
          .value;

  final _$genresAtom = Atom(name: '_TmdbStore.genres');

  @override
  ObservableList<String> get genres {
    _$genresAtom.reportRead();
    return super.genres;
  }

  @override
  set genres(ObservableList<String> value) {
    _$genresAtom.reportWrite(value, super.genres, () {
      super.genres = value;
    });
  }

  final _$getGenresAsyncAction = AsyncAction('_TmdbStore.getGenres');

  @override
  Future<dynamic> getGenres() {
    return _$getGenresAsyncAction.run(() => super.getGenres());
  }

  @override
  String toString() {
    return '''
genres: ${genres},
genresCount: ${genresCount}
    ''';
  }
}
