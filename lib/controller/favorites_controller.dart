import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteNotifier extends ChangeNotifier {
  final _favbox = Hive.box('fav_box');
  List<dynamic> _favorites = [];
  List<dynamic> _ids = [];
  List<dynamic> _fav = [];

  List<dynamic> get ids => _ids;

  set ids(List<dynamic> newids) {
    _ids = newids;
    notifyListeners();
  }

  List<dynamic> get favorites => _favorites;

  set favorites(List<dynamic> newfav) {
    _favorites = newfav;
    notifyListeners();
  }

  List<dynamic> get fav => _fav;

  set fav(List<dynamic> newfav) {
    _fav = newfav;
    notifyListeners();
  }

  getfavrites() {
    final favbox = _favbox.keys.map((key) {
      final item = _favbox.get(key);

      return {
        "key": key,
        "id": item["id"],
      };
    }).toList();

    _favorites = favbox.toList();
    _ids = _favorites.map((item) => item["id"]).toList();
  }

  Future<void> createfav(Map<String, dynamic> addfav) async {
    await _favbox.add(addfav);
  }

  getalldata() {
    final favdata = _favbox.keys.map((key) {
      final item = _favbox.get(key);

      return {
        'key': key,
        'id': item['id'],
        'category': item['category'],
        'name': item['name'],
        'price': item['price'],
        'imageurl': item['imageurl'],
      };
    }).toList();
    _fav = favdata.reversed.toList();
  }

  Future<void> deletefav(int key) async {
    await _favbox.delete(key);
  }
}
