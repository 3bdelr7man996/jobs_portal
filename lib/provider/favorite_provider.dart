import 'package:flutter/material.dart';
import 'package:job_search/data/repositories/favorite_repo.dart';

class FavoriteProvider with ChangeNotifier {
  final FavoriteRepository repository;

  FavoriteProvider(this.repository);

  Future<void> addJobToFav(String slug) async {
    try {
      //todo add Fav To Local List
      await repository.addToFav(slug);
    } catch (e) {
      //todo remove Fav from Local List
      debugPrint(e.toString());
    }
  }

  Future<void> removeJobFromFav(String slug) async {
    try {
      //todo remove Fav from Local List
      await repository.removeFromFav(slug);
    } catch (e) {
      //todo add Fav to Local List
      debugPrint(e.toString());
    }
  }

  Future<void> fetchFavList({bool reload = false}) async {
    //todo implement
  }
}
