import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'profile_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  Future<void> _login() async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      print('Login sukses!');
    } catch (e) {
      print('Login gagal: $e');
    }
  }

  Future<void> _register() async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      print('Registrasi sukses!');
    } catch (e) {
      print('Registrasi gagal: $e');
    }
  }
  Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => ProfileScreen()),
);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login Jomblo Locator")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(children: [
          TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
          TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(labelText: 'Password')),
          SizedBox(height: 20),
          ElevatedButton(onPressed: _login, child: Text('Login')),
          TextButton(onPressed: _register, child: Text('Daftar'))
        ]),
      ),
    );
  }
}
