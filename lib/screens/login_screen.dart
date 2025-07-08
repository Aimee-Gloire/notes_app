// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'signup_screen.dart';
import 'notes_screen.dart';
import 'package:provider/provider.dart';
import '../providers/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: SingleChildScrollView(
        child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
            TextField(controller: passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                bool success = await authProvider.signIn(emailController.text, passwordController.text);
                if (success) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Login successful'),
                    backgroundColor: Colors.green,
                  ));
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => NotesScreen()));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Login failed'),
                    backgroundColor: Colors.red,
                  ));
                }
              },
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) => SignupScreen()));
              },
              child: Text('Don’t have an account? Sign Up'),
            )
          ],
        ),
      ),
      ),
    );
  }
}
