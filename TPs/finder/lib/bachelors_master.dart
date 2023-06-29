import 'package:flutter/material.dart';
import 'package:finder/data.dart' as data;
import 'package:finder/models/bachelor.dart';
import 'package:finder/bachelor_preview.dart';
import 'package:go_router/go_router.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  List<Bachelor> bachelors = data.initBachelors();
  List<Bachelor> bachelorsLikes = [];

  void like(Bachelor bachelor) {
    setState(() {
      if (bachelorsLikes.contains(bachelor)) {
        bachelorsLikes.remove(bachelor);
      } else {
        bachelorsLikes.add(bachelor);
      }
    });
  }

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
        itemCount: bachelors.length,
        itemBuilder: (context, index) {
          final bachelor = bachelors[index];
          return BachelorsPreview(
            bachelor: bachelor,
            like: () => like(bachelor),
            bachelorsLikes: bachelorsLikes.contains(bachelor),
          );
        },
      ),
    );
  }
}
