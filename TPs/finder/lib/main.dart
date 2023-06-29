import 'package:finder/app.dart';
import 'package:finder/bachelors_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => BachelorsFavoriteProvider(),
      child: MyApp(),
    ),
  );
}
