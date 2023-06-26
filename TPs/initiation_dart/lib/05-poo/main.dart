import 'package:initiation_dart/05-poo/classes/Lesson.dart';
import 'package:initiation_dart/05-poo/classes/Student.dart';
import 'package:initiation_dart/05-poo/classes/User.dart';

void exercice5() {
  final User johndoe = User('John', 'Doe', 'john@doe.com');
  johndoe.password = '123456';
  print(johndoe);
  johndoe.sayHello();
  print(johndoe.authenticate('123456'));
  print(johndoe.authenticate('1234567'));

  final Student johndoe2 = Student('John', 'Doe');
  final Lesson italian = Lesson('Italian');
  johndoe2.lessons = [italian];
  print(johndoe2);
  final Lesson french = Lesson('French');
  johndoe2.lessons.add(french);
  print(johndoe2);
  johndoe2.lessons.remove(italian);
  print(johndoe2);
}
