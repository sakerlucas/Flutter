import 'package:finder/models/bachelor.dart';
import 'package:flutter/material.dart';

class BachelorsDetails extends StatefulWidget {
  const BachelorsDetails({Key? key, required this.bachelor}) : super(key: key);

  final Bachelor bachelor;

  @override
  _BachelorsDetail createState() => _BachelorsDetail(this.bachelor);
}

class _BachelorsDetail extends State<BachelorsDetails> {
  _BachelorsDetail(this.bachelor);

  final Bachelor bachelor;
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;
      if (_isFavorite) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Ajouté aux favoris'),
            duration: Duration(seconds: 1),
          ),
        );
      }
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
                color: _isFavorite
                    ? Colors.red
                    : Theme.of(context).colorScheme.secondary,
                width: _isFavorite ? 5 : 2,
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
          //add a haerth button
          IconButton(
            icon: Icon(
              _isFavorite ? Icons.favorite : Icons.favorite_border,
              color: _isFavorite ? Colors.red : null,
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
