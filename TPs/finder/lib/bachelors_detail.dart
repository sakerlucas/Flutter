import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorsDetails extends StatefulWidget {
  const BachelorsDetails(
      {Key? key,
      required this.bachelor,
      required this.bachelorsLikes,
      required this.like})
      : super(key: key);

  final Bachelor bachelor;
  final bool bachelorsLikes;
  final VoidCallback like;

  @override
  _BachelorsDetail createState() =>
      _BachelorsDetail(bachelor, like, bachelorsLikes);
}

class _BachelorsDetail extends State<BachelorsDetails> {
  _BachelorsDetail(this.bachelor, this.like, this.bachelorsLikes);

  final Bachelor bachelor;
  final bool bachelorsLikes;
  final VoidCallback like;
  bool? _isFavorite;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite == null) {
        _isFavorite = !bachelorsLikes;
      } else {
        _isFavorite = !_isFavorite!;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            (_isFavorite == null && bachelorsLikes || _isFavorite == true)
                ? 'Vous avez ajouté ${bachelor.firstName} ${bachelor.lastName} à vos favoris'
                : 'Vous avez retiré ${bachelor.firstName} ${bachelor.lastName} de vos favoris',
          ),
          duration: const Duration(seconds: 1),
        ),
      );

      like();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Finder'),
      ),
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 20)),
          //assetimage avec bordure
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: (_isFavorite == null && bachelorsLikes ||
                        _isFavorite == true)
                    ? Colors.red
                    : Theme.of(context).colorScheme.secondary,
                width: (_isFavorite == null && bachelorsLikes ||
                        _isFavorite == true)
                    ? 5
                    : 2,
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(bachelor.avatar),
              ),
            ),
          ),
          ListTile(
            title: Text(bachelor.firstName,
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center),
            subtitle: Text(bachelor.lastName,
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center),
          ),
          ListTile(
            title: const Text(
              'Job :',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(bachelor.job ?? 'No job'),
          ),
          ListTile(
            title: const Text(
              'Description',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(bachelor.description ?? 'No description'),
          ),
          IconButton(
            icon: Icon(
              (_isFavorite == null && bachelorsLikes || _isFavorite == true)
                  ? Icons.favorite
                  : Icons.favorite_border,
              color:
                  (_isFavorite == null && bachelorsLikes || _isFavorite == true)
                      ? Colors.red
                      : null,
            ),
            iconSize: 40,
            onPressed: () {
              _toggleFavorite();
            },
          ),
        ],
      ),
    );
  }
}
