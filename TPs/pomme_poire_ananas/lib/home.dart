import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 1;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  bool _estNombrePremier(int n) {
    if (n <= 1) {
      return false;
    }
    for (int i = 2; i < n; i++) {
      if (n % i == 0) {
        return false;
      }
    }
    return true;
  }

  String _returnType() {
    if (_estNombrePremier(_counter - 1)) {
      return 'nombre premier';
    } else if (_counter - 1 % 2 == 0) {
      return 'pair';
    } else {
      return 'impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('${_counter - 1} : ${_returnType()}'),
      ),
      body: ListView.builder(
        itemCount: _counter - 1,
        itemBuilder: (context, index) {
          return ListTile(
            tileColor: index % 2 == 0 ? Colors.cyan : Colors.indigo,
            title: Row(
              children: [
                if (_estNombrePremier(index + 1))
                  const Image(
                    image: AssetImage('images/ananas.png'),
                    width: 40,
                    height: 40,
                  )
                else if ((index + 1) % 2 == 0)
                  const Image(
                    image: AssetImage('images/poire.png'),
                    width: 40,
                    height: 40,
                  )
                else
                  const Image(
                    image: AssetImage('images/pomme.png'),
                    width: 40,
                    height: 40,
                  ),
                Text('${index + 1}'),
              ],
            ),
            textColor: Colors.white,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
