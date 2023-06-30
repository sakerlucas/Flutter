import 'package:finder/bachelors_detail.dart';
import 'package:finder/bachelors_favorite.dart';
import 'package:finder/bachelors_master.dart';
import 'package:finder/bachelors_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      GoRoute(
        path: '/bachelor/:id',
        builder: (BuildContext context, GoRouterState state) {
          final String id = state.pathParameters['id']!;
          final bachelor =
              context.read<BachelorsProvider>().bachelors.firstWhere(
                    (element) => element.id == id,
                  );
          return BachelorsDetails(
            bachelor: bachelor,
          );
        },
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Finder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}
