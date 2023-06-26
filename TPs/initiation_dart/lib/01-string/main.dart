import 'dart:math';

void exercice1() {
  print('Hello, World !');
  final String message = 'Hello, World !';
  print(message);
  final String hello = 'Hello';
  final String world = 'World';
  print('$hello, $world !');
  print(hello.toUpperCase() + ', ' + world.toUpperCase() + ' !');
  print(message.substring(0, 5));
  print(message.split(', ')[0]);
  final String message2 = 'Hello, World !';
  print(message2.length);
  final String welcome = 'Hello, World !';
  print(welcome
      .replaceAll('o', '8')
      .replaceAll('l', '1')
      .replaceAll('e', '3')
      .toUpperCase());
  final String welcome2 = 'Hello World';
  final List<String> words = welcome2.split(' ');
  print(words);
  final String pwd = "zz";
  print(pwd.isEmpty ? "Mot de passe manquant" : "Mot de passe fourni");
  final String email = "john@doe.com";
  print(email.contains('@') && email.contains('.')
      ? "Adresse email valide"
      : "Adresse email invalide");
}
