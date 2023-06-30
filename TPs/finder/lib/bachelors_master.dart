import 'package:finder/bachelors_unlike_provider.dart';
import 'package:finder/bachelors_provider.dart';
import 'package:flutter/material.dart';
import 'package:finder/models/bachelor.dart';
import 'package:finder/bachelor_preview.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class BachelorsMaster extends StatefulWidget {
  const BachelorsMaster({super.key});

  @override
  State<BachelorsMaster> createState() => _BachelorsMasterState();
}

class _BachelorsMasterState extends State<BachelorsMaster> {
  Gender? gender = Gender.all;

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
      body: Column(
        children: [
          ListTile(
            title: const Text('All'),
            leading: Radio<Gender>(
              value: Gender.all,
              groupValue: gender,
              onChanged: (Gender? value) {
                setState(() {
                  gender = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Males'),
            leading: Radio<Gender>(
              value: Gender.male,
              groupValue: gender,
              onChanged: (Gender? value) {
                setState(() {
                  gender = value;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Females'),
            leading: Radio<Gender>(
              value: Gender.female,
              groupValue: gender,
              onChanged: (Gender? value) {
                setState(() {
                  gender = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: context
                  .watch<BachelorsProvider>()
                  .bachelors
                  .where(
                    (bachelor) =>
                        (bachelor.gender == gender || gender == Gender.all),
                  )
                  .length,
              itemBuilder: (context, index) {
                //recupere le bachelor a l'index avec le gender selectionné
                final Bachelor bachelor = context
                    .read<BachelorsProvider>()
                    .bachelors
                    .where((bachelor) =>
                        (bachelor.gender == gender || gender == Gender.all))
                    .toList()[index];

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
          ),
        ],
      ),
    );
  }
}
