void exercice6() {
  int sum(int a, int b) {
    return (a + b);
  }

  assert(sum(2, 5) == 7);
  assert(sum(5, 5) == 10);

  Never sumFails(int a, int b) {
    throw ArgumentError('Erreur');
  }

  assert(sum(0, 1) == 1, sumFails(0, 1));

  dynamic something;
  something = 7;
  print(something.runtimeType);
  assert(something is int);

  something = 'Seven';
  print(something.runtimeType);
  assert(something is String);
}
