import 'package:finder/bachelors_favorite.dart';
import 'package:finder/bachelors_master.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const BachelorsMaster(),
      ),
      GoRoute(
        path: '/favorites',
        builder: (context, state) => const BachelorsFavorite(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
