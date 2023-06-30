import 'package:finder/app.dart';
import 'package:finder/bachelors_favorite_provider.dart';
import 'package:finder/bachelors_unlike_provider.dart';
import 'package:finder/bachelors_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => BachelorsFavoriteProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BachelorsUnlikeProvider(),
      ),
      ChangeNotifierProvider(
        create: (_) => BachelorsProvider(),
      ),
    ],
    child: MyApp(),
  ));
}
