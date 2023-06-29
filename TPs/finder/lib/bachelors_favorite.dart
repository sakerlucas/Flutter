import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BachelorsFavorite extends StatefulWidget {
  const BachelorsFavorite({Key? key}) : super(key: key);

  @override
  State<BachelorsFavorite> createState() => _BachelorsFavoriteState();
}

class _BachelorsFavoriteState extends State<BachelorsFavorite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Favorites'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/');
            },
            icon: const Icon(Icons.home),
          ),
        ],
      ),
      body: const Center(
        child: Text('Favorites'),
      ),
    );
  }
}
