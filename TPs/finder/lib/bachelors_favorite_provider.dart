import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorsFavoriteProvider extends ChangeNotifier {
  final List<Bachelor> _bachelorsFavorite = [];

  List<Bachelor> get bachelorsFavorite => _bachelorsFavorite;

  void add(Bachelor bachelor) {
    _bachelorsFavorite.add(bachelor);
    notifyListeners();
  }

  void remove(Bachelor bachelor) {
    _bachelorsFavorite.remove(bachelor);
    notifyListeners();
  }

  bool contains(Bachelor bachelor) {
    return _bachelorsFavorite.contains(bachelor);
  }
}
