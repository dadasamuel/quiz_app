import 'package:flutter/material.dart';
import 'package:quizzler/quizpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('QUIZZLER',
          style: TextStyle(
            color:Colors.white,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
        body: quizPage(),
      ),
    );
  }
}
