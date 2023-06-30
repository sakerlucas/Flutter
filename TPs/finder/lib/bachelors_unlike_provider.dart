import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorsUnlikeProvider extends ChangeNotifier {
  final List<Bachelor> _bachelorsUnlike = [];

  List<Bachelor> get bachelorsUnlike => List.unmodifiable(_bachelorsUnlike);

  void add(Bachelor bachelor) {
    _bachelorsUnlike.add(bachelor);
    notifyListeners();
  }

  void remove(Bachelor bachelor) {
    _bachelorsUnlike.remove(bachelor);
    notifyListeners();
  }

  bool contains(Bachelor bachelor) {
    return _bachelorsUnlike.contains(bachelor);
  }
}
