import 'package:finder/bachelors_favorite_provider.dart';
import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';
//import provider
import 'package:provider/provider.dart';

class BachelorsDetails extends StatefulWidget {
  const BachelorsDetails({
    Key? key,
    required this.bachelor,
  }) : super(key: key);

  final Bachelor bachelor;

  @override
  _BachelorsDetail createState() => _BachelorsDetail(
        bachelor,
      );
}

class _BachelorsDetail extends State<BachelorsDetails> {
  _BachelorsDetail(this.bachelor);

  final Bachelor bachelor;
  bool? _isFavorite;
  bool? _isDislike;
  late bool? _isInFavoriteList;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite == null) {
        _isFavorite = !_isInFavoriteList!;
      } else {
        _isFavorite = !_isFavorite!;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          (_isFavorite == null && _isInFavoriteList! || _isFavorite == true)
              ? 'Vous avez ajouté ${bachelor.firstName} ${bachelor.lastName} à vos favoris'
              : 'Vous avez retiré ${bachelor.firstName} ${bachelor.lastName} de vos favoris',
        ),
        duration: const Duration(seconds: 1),
      ),
    );

    if (_isFavorite == null && _isInFavoriteList! || _isFavorite == true) {
      context.read<BachelorsFavoriteProvider>().add(bachelor);
    } else {
      context.read<BachelorsFavoriteProvider>().remove(bachelor);
    }
  }

  void _toggleDislike() {
    setState(() {
      if (_isDislike == null) {
        _isDislike = !_isInFavoriteList!;
      } else {
        _isDislike = !_isDislike!;
      }
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          (_isDislike == null && _isInFavoriteList! || _isDislike == true)
              ? 'Vous avez masqué ${bachelor.firstName} ${bachelor.lastName} à votre liste'
              : 'Vous avez rajouté ${bachelor.firstName} ${bachelor.lastName} à votre liste',
        ),
        duration: const Duration(seconds: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    _isInFavoriteList =
        context.watch<BachelorsFavoriteProvider>().contains(bachelor);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
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
                color: (_isFavorite == null && _isInFavoriteList! ||
                        _isFavorite == true)
                    ? Colors.red
                    //sinon si gender est male alors colors blue sinon pink
                    : bachelor.gender == Gender.male
                        ? const Color.fromARGB(255, 168, 245, 255)
                        : const Color.fromARGB(255, 255, 189, 211),
                width: (_isFavorite == null && _isInFavoriteList! ||
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(
                  (_isFavorite == null && _isInFavoriteList! ||
                          _isFavorite == true)
                      ? Icons.favorite
                      : Icons.favorite_border,
                  color: (_isFavorite == null && _isInFavoriteList! ||
                          _isFavorite == true)
                      ? Colors.red
                      : null,
                ),
                iconSize: 40,
                onPressed: () {
                  _toggleFavorite();
                },
              ),
              IconButton(
                icon: Icon(
                  (_isDislike == null && _isInFavoriteList! ||
                          _isDislike == true)
                      ? Icons.heart_broken
                      : Icons.heart_broken_outlined,
                ),
                iconSize: 40,
                onPressed: () {
                  _toggleDislike();
                },
              ),
            ],
          )

          // IconButton(
          //   icon: Icon(
          //     (_isFavorite == null && _isInFavoriteList! || _isFavorite == true)
          //         ? Icons.favorite
          //         : Icons.favorite_border,
          //     color: (_isFavorite == null && _isInFavoriteList! ||
          //             _isFavorite == true)
          //         ? Colors.red
          //         : null,
          //   ),
          //   iconSize: 40,
          //   onPressed: () {
          //     _toggleFavorite();
          //   },
          // ),
        ],
      ),
    );
  }
}
