import 'package:flutter_road/models/user.dart';

class AuthenticationArray {
  static List<User> users = [];

  static void addUser(String username, String email, String password) {
    users.add(User(username: username, email: email, password: password));
  }

  static bool isValidUser(String username, String password) {
    for (int i = 0; i < users.length; i++) {
      if (users[i].username == username && users[i].password == password) {
        return true;
      }
    }
    return false;
  }
}
