import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatelessWidget {
   HomePage({super.key});

   String? Name,City,Email;
   getData()async{
     var url = Uri.parse('http://localhost:3000/');
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: [
        Text(),
      ],),
    );
  }
}
