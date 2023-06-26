void exercice3() {
  final List<String> planets = [
    'Terre',
    'Mars',
    'Mercure',
    'Saturne',
    'Venus',
    'Neptune',
    'Uranus',
    'Jupiter'
  ];
  planets.sort();
  print(planets);
  for (String planet in planets) {
    print(planet.toUpperCase());
  }
  int i = 0;
  while (i < planets.length) {
    print(planets[i][0]);
    i++;
  }
  int j = 0;
  do {
    print('${j + 1} - ${planets[j]}');
    j++;
  } while (j < planets.length);
  int k = 0;
  while (k < planets.length) {
    if (planets[k].endsWith('e') ||
        planets[k].endsWith('a') ||
        planets[k].endsWith('i') ||
        planets[k].endsWith('o') ||
        planets[k].endsWith('u')) {
      print(planets[k]);
    }
    k++;
  }
  planets.add('Pluton');
  print(planets);

  Planet mercure = Planet('Mercure', 91.69);
  Planet saturne = Planet('Saturne', 1275);
  Planet neptune = Planet('Neptune', 4351.40);
  Planet jupiter = Planet('Jupiter', 628.73);
  Planet mars = Planet('Mars', 78.34);
  Planet venus = Planet('Venus', 41.40);
  Planet uranus = Planet('Uranus', 2723.95);

  List<Planet> planets2 = [
    mercure,
    saturne,
    neptune,
    jupiter,
    mars,
    venus,
    uranus
  ];

  planets2.sort((a, b) => a.distanceFromEarth.compareTo(b.distanceFromEarth));
  print(planets2);

  Map<String, String> apollo = {
    '07_1969': 'Neil Armstrong + Buzz Aldrin',
    '11_1969': 'Apollo 12',
    '02_1971': 'Apollo 14',
    '07_1971': 'Apollo 15',
    '04_1972': 'Apollo 16',
    '12_1972': 'Apollo 17'
  };
  print(apollo);
  print(apollo['07_1971']);
  print(apollo.keys);
  print(apollo.values);
  print(apollo['07_1969']);

  SolarSystemElement sun = SolarSystemElement('sun', Kind.star);
  SolarSystemElement earth = SolarSystemElement('earth', Kind.planet);
  SolarSystemElement moon = SolarSystemElement('moon', Kind.satellite);
  SolarSystemElement pluton = SolarSystemElement('pluton', Kind.satellite);
  print(sun);
  print(earth);
  print(moon);
  print(pluton);
}

class Planet {
  String name;
  double distanceFromEarth;

  Planet(this.name, this.distanceFromEarth);

  @override
  String toString() {
    return 'Planet{name: $name, distanceFromEarth: $distanceFromEarth}';
  }
}

enum Kind { planet, star, satellite, asteroid, comet }

class SolarSystemElement {
  String name;
  Kind kind;

  SolarSystemElement(this.name, this.kind);

  @override
  String toString() {
    return 'SolarSystemElement{name: $name, kind: $kind}';
  }
}
