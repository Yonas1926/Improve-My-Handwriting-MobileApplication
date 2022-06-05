import 'package:flutter/material.dart';
import 'package:imporve_my_handwriting_app/screens/Log_in.dart';
import 'package:imporve_my_handwriting_app/screens/Practice_page.dart';
import 'package:imporve_my_handwriting_app/screens/home_page.dart';
import 'package:imporve_my_handwriting_app/screens/test_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedStyleIndex = -1;
  final pageIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Improve My Handwriting!",
      debugShowCheckedModeBanner: false,
      home: Navigator(
        pages: [
          MaterialPage(
            child: HomeScreen(
                didSelectStyle: ((value) =>
                    setState(() => _selectedStyleIndex = value))),
          ),
          if (_selectedStyleIndex != -1)
            MaterialPage(
              child: PracticePage(
                style_index: _selectedStyleIndex,
              ),
            )
          else if (_selectedStyleIndex != -2)
            MaterialPage(child: Log_in_screen()),
        ],
        onPopPage: (route, result) {
          _selectedStyleIndex = -1;
          return route.didPop(result);
        },
      ),
    );
  }
}
