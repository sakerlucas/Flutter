import 'dart:math';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter1 = 0;
  int _counter2 = 0;

  bool _isWinner() {
    return _counter == _counter1 && _counter1 == _counter2 && _counter != 0;
  }

  void _randomNumbers() {
    setState(() {
      _counter = Random().nextInt(7) + 1;
      _counter1 = Random().nextInt(7) + 1;
      _counter2 = Random().nextInt(7) + 1;
    });
  }

  bool _isBigWinner() {
    return _counter == 7 && _counter1 == 7 && _counter2 == 7;
  }

  Widget _displayImage(int index) {
    switch (index) {
      case 1:
        return Image.asset('images/bar.png', width: 100, height: 100);
      case 2:
        return Image.asset('images/cerise.png', width: 100, height: 100);
      case 3:
        return Image.asset('images/cloche.png', width: 100, height: 100);
      case 4:
        return Image.asset('images/diamant.png', width: 100, height: 100);
      case 5:
        return Image.asset('images/fer-a-cheval.png', width: 100, height: 100);
      case 6:
        return Image.asset('images/pasteque.png', width: 100, height: 100);
      case 7:
        return Image.asset('images/sept.png', width: 100, height: 100);
      default:
        return Image.asset('images/sept.png', width: 100, height: 100);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _isBigWinner()
            ? const Color.fromARGB(255, 255, 230, 0)
            //sinon si _isWinner() est vrai
            : _isWinner()
                ? const Color.fromARGB(255, 255, 240, 109)
                //sinon si _isWinner() est faux
                : Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      backgroundColor: _isBigWinner()
          ? const Color.fromARGB(255, 255, 240, 109)
          : Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_counter == 0 && _counter1 == 0 && _counter2 == 0)
              Text(
                'Appuyez sur SPIN pour jouer !',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
            if (_counter != 0 && _counter1 != 0 && _counter2 != 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _displayImage(_counter),
                  _displayImage(_counter1),
                  _displayImage(_counter2),
                ],
              ),
            if (_isWinner() && !_isBigWinner() && _counter != 0)
              Text(
                'Vous avez gagné !',
                style: Theme.of(context).textTheme.headline2,
              ),
            if (!_isWinner() && _counter != 0)
              Text(
                'Vous avez perdu !',
                style: Theme.of(context).textTheme.headline2,
              ),
            if (_isBigWinner())
              Text(
                'Vous avez gagné le gros lot !',
                style: Theme.of(context).textTheme.headline2,
                textAlign: TextAlign.center,
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _randomNumbers,
        tooltip: 'Increment',
        child: const Text('SPIN'),
      ),
    );
  }
}
