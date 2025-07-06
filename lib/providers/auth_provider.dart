import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  Future<bool> signIn(String email, String password) async {
    return true;
  }

  Future<bool> signUp(String email, String password) async {
    return true;
  }
}
