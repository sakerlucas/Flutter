import 'package:initiation_dart/05-poo/classes/Lesson.dart';

class Student {
  String _firstName;
  String _lastName;
  List<Lesson> _lessons = [];

  Student(this._firstName, this._lastName);

  set firstName(String firstName) {
    _firstName = firstName;
  }

  set lastName(String lastName) {
    _lastName = lastName;
  }

  set lessons(List<Lesson> lessons) {
    _lessons = lessons;
  }

  String get firstName => _firstName;

  String get lastName => _lastName;

  List<Lesson> get lessons => _lessons;

  @override
  String toString() {
    return 'Student{firstName: $_firstName, lastName: $_lastName, lessons: $_lessons}';
  }
}
