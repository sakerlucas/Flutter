import 'dart:convert';

class User {
  String firstName;
  String lastName;
  String email;
  String _password;
  String _hash;

  User(this.firstName, this.lastName, this.email,
      [this._password = '', this._hash = '']);

  @override
  String toString() {
    return 'User{firstName: $firstName, lastName: $lastName, email: $email, password: *****}';
  }

  set password(String password) {
    _password = password;
    _hash = base64.encode(_password.hashCode.toString().codeUnits);
  }

  void sayHello() {
    print("Hello, I'm $firstName $lastName !");
  }

  bool authenticate(String password) {
    return _hash == base64.encode(password.hashCode.toString().codeUnits);
  }
}
