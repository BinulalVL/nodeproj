import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nodeproj/Screens/homepage.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String? email, password;
  loginFunction(String email, String password) async {
    var url = Uri.parse('http://localhost:3000/loginapi/login');
    var response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({'Email': email, 'Password': password}));
    if (response.statusCode == 200) {
      print(response.body);
      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ));
    } else {
      print("Login Failed ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(
            controller: emailController,
            decoration: const InputDecoration(hintText: 'Email'),
          ),
          TextField(
            controller: passwordController,
            decoration: const InputDecoration(hintText: 'Password'),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  email = emailController.text;
                  password = passwordController.text;
                });
                loginFunction(email!, password!);
              },
              child: const Text('Login'))
        ],
      ),
    );
  }
}
