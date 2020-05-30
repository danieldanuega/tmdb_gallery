import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:http/http.dart' as http;
import 'package:tmdb_gallery/constant.dart';

part 'tmdb_store.g.dart';

class TmdbStore extends _TmdbStore with _$TmdbStore {}

abstract class _TmdbStore with Store {
  @observable
  ObservableList<String> genres = ObservableList<String>();

  @computed
  int get genresCount {
    final count = this.genres.length;
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
          this.genres.add(r["name"]);
        }
      } else {
        print(response.statusCode);
      }
    } catch (err) {
      print(err);
    }
  }
}
