import 'package:initiation_dart/05-poo/classes/User.dart';

class Admin extends User {
  int _grade = 1;

  Admin(super.firstName, super.lastName, super.email, this._grade);

  set grade(int grade) {
    _grade = grade;
  }

  int get grade => _grade;
}
