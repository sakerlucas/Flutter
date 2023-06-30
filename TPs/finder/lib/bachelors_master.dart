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
  final fieldText = TextEditingController();
  String searchValue = '';

  void research(String bachelorName) {
    context.read<BachelorsProvider>().search(bachelorName);
    //update the list of bachelors
    setState(() {});
  }

  void clearText() {
    fieldText.clear();
    searchValue = '';
    research(searchValue);
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
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: fieldText,
                onChanged: (value) {
                  searchValue = value;
                  research(searchValue);
                },
                decoration: InputDecoration(
                  labelText: 'Search bachelor',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: IconButton(
                      onPressed: () {
                        clearText();
                      },
                      icon: const Icon(Icons.delete)),
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                ),
              ),
              Column(
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
                ],
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
          )),
    );
  }
}
