import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  final AuthService _authService = AuthService();

  Future<bool> signIn(String email, String password) async {
    final result = await _authService.signIn(email, password);
    return result == null;
  }

  Future<bool> signUp(String email, String password) async {
    final result = await _authService.signUp(email, password);
    return result == null;
  }

  void signOut() {
    _authService.signOut();
  }
}
