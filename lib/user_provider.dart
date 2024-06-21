import 'package:ecommerce_final_project/models/user.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  User _user = User(username: 'Sigit', email: 'sigit@gmail.com');

  User get user => _user;

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }
}