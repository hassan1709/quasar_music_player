import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  bool _isAuthenticated = false;
  late String _id;
  late String _email;
  late String _name;
  late String _password;

  bool get isAuthenticated {
    return _isAuthenticated;
  }

  set isAuthenticated(bool isAuthenticated) {
    _isAuthenticated = isAuthenticated;
    notifyListeners();
  }

  String get name {
    return _name;
  }

  set name(String name) {
    _name = name;
    notifyListeners();
  }

  String get id {
    return _id;
  }

  set id(String id) {
    _id = id;
    notifyListeners();
  }

  String get email {
    return _email;
  }

  set email(String email) {
    _email = email;
    notifyListeners();
  }

  String get password {
    return _password;
  }

  set password(String password) {
    _password = password;
    notifyListeners();
  }
}
