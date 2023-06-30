import 'package:finder/bachelors_unlike_provider.dart';
import 'package:finder/bachelors_provider.dart';
import 'package:flutter/material.dart';
import 'package:finder/bachelor_preview.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Finder'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              context.go('/favorites');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<BachelorsProvider>().bachelors.length,
        itemBuilder: (context, index) {
          final bachelor = context.watch<BachelorsProvider>().bachelors[index];

          final search = context
              .read<BachelorsUnlikeProvider>()
              .bachelorsUnlike
              .where((element) => element.id == bachelor.id)
              .toList();

          return search.isEmpty
              ? BachelorsPreview(
                  bachelor: bachelor,
                )
              : Container();
        },
      ),
    );
  }
}
