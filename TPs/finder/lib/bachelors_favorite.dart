import 'package:finder/bachelor_preview.dart';
import 'package:finder/bachelors_favorite_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

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
      body: ListView.builder(
        itemCount:
            context.watch<BachelorsFavoriteProvider>().bachelorsFavorite.length,
        itemBuilder: (context, index) {
          final bachelor = context
              .watch<BachelorsFavoriteProvider>()
              .bachelorsFavorite[index];
          return Column(
            children: [
              BachelorsPreview(
                bachelor: bachelor,
              ),
              //add button to remove from favorite
              IconButton(
                onPressed: () {
                  context.read<BachelorsFavoriteProvider>().remove(bachelor);
                },
                icon: const Icon(Icons.delete),
              ),
              const Divider(),
            ],
          );
        },
      ),
    );
  }
}
