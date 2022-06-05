import 'dart:js';

import 'package:flutter/material.dart';
import 'package:imporve_my_handwriting_app/screens/Log_in.dart';
import 'package:imporve_my_handwriting_app/screens/My_Progress_page.dart';

class HomeScreen extends StatelessWidget {
  List<String> _writingStyles = [
    "Indie Flower",
    "Jura",
    "Kristi",
    "Marck Script",
    "Patrick Hand",
    "Permanenet Marker"
  ];

  final ValueChanged didSelectStyle;

  HomeScreen({super.key, required this.didSelectStyle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Choose a writing style!"),
        // leading: Icon(Icons.brush),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.blueAccent,
            ]),
          ),
        ),
      ),
      body: Center(
        child: Stack(alignment: AlignmentDirectional.centerStart, children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue,
                  Colors.purple,
                ],
              ),
            ),
          ),
          ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                final style_index = index;
                return Column(
                  children: [
                    SizedBox(
                      height: 5,
                    ),
                    Card(
                      elevation: 0.2,
                      color: Color.fromARGB(0, 79, 79, 79),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: ListTile(
                        title: Text(
                          "${index + 1}. ${_writingStyles[index]}",
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: SizedBox(
                          width: 50,
                          height: 50,
                        ),
                        onTap: () {
                          // Go to Practice page of selected style.
                          didSelectStyle(style_index);
                        },
                      ),
                    ),
                  ],
                );
              }),
        ]),
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue,
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.lightBlueAccent,
                Colors.lightBlue,
                Colors.blue,
                Colors.blueAccent,
                Colors.lightBlue,
              ],
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: MediaQuery.of(context).size.height * 0.1,
                child: ClipRRect(
                  child: Image.asset(
                    'assets/images/circleAvatar.png',
                    height: MediaQuery.of(context).size.height * 0.5,
                  ),
                  borderRadius: BorderRadius.circular(100.0),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Container(
                color: Colors.transparent,
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width,
                child: ListView(children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      drawerCards_MyProgress(),
                      drawerCards_LogOut(),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }

  Card drawerCards_MyProgress() {
    return Card(
      elevation: 0.2,
      color: Color.fromARGB(0, 79, 79, 79),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(
          "My Progress",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
        ),
        leading: SizedBox(
          width: 5,
          height: 5,
        ),
        onTap: () {
           // Go to My progress page.
        },
      ),
    );
  }

  Card drawerCards_LogOut() {
    return Card(
      elevation: 0.2,
      color: Color.fromARGB(0, 79, 79, 79),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        title: Text(
          "Log Out",
          style: TextStyle(color: Colors.white),
          textAlign: TextAlign.start,
        ),
        leading: SizedBox(
          width: 5,
          height: 5,
        ),
        onTap: () {
          MaterialPage(
            child: Log_in_screen(),
          );
          // pageIndex(2);
        },
      ),
    );
  }
}
