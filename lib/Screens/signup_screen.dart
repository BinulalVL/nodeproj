import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:nodeproj/Screens/login_screen.dart';

class SignUp extends StatefulWidget {
  SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // postData(String name, String password, String city) async {
  //   String url = "http://localhost:3000/api/postdata";
  //   Uri Url = Uri.parse(url);
  //   print(Url);
  //   try {
  //     var response = await http.post(
  //       Url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode({
  //         "name": name,
  //         "password": password,
  //         "city": city,
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       print("Data Stored successfully: ${response.body}");
  //     } else {
  //       print("Error: ${response.statusCode}");
  //       print("Response body: ${response.body}");
  //     }
  //   } catch (e) {
  //     print("Error sending request: $e");
  //   }
  // }

  postData(String name, String password, String city) async {
    String url = "http://localhost:3000/api/postdata";
    Uri Url = Uri.parse(url);
    print(Url);
    try {
      var response = await http.post(Url,
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          },
          body: jsonEncode({"name": name, "password": password, "city": city}));
      if (response.statusCode == 200) {
        print("Data Stored successfully: ${response.body}");
      } else {
        print("Error: ${response.statusCode}");
        print("Response body: ${response.body}");
      }
    } catch (e) {
      print("Error sending request: $e");
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController cityController = TextEditingController();

  String? name, city, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextField(controller: nameController),
          TextField(controller: cityController),
          TextField(controller: passwordController),
          ElevatedButton(
            onPressed: () {
              setState(() {
                name = nameController.text.toString();
                city = cityController.text.toString();
                password = passwordController.text.toString();
              });
              postData(name!, password!, city!);
            },
            child: Text('SignUp'),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return LoginPage();
                  },
                ));
              },
              child: Text('login'))
        ],
      ),
    );
  }
}
