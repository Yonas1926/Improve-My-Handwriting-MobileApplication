import 'package:flutter/material.dart';
import 'package:imporve_my_handwriting_app/screens/Practice_page.dart';
import 'package:imporve_my_handwriting_app/screens/test_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Improve My Handwriting!",
      debugShowCheckedModeBanner: false,
      home: TestScreen(),
    );
  }
}

