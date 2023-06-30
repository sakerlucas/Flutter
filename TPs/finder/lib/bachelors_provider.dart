import 'package:flutter/material.dart';
import 'package:finder/data.dart' as data;
import 'package:finder/models/bachelor.dart';

class BachelorsProvider extends ChangeNotifier {
  late List<Bachelor> _bachelors = data.initBachelors();

  List<Bachelor> get bachelors => List.unmodifiable(_bachelors);

  @override
  String toString() {
    // TODO: return ids of bachelors
    return _bachelors.map((e) => e.id).toList().toString();
  }

  void search(String searchValue) {
    _bachelors = data
        .initBachelors()
        .where((element) => element.firstName.contains(searchValue))
        .toList();
  }
}
