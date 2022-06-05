import 'package:flutter/material.dart';

class MyProgressScreen extends StatelessWidget {
  Map<String, List<Offset>> progress = {
    "Prog 1": [Offset(10, 11),Offset(10, 11),Offset(10, 11)],
    "Prog 2": [Offset(10, 11),Offset(10, 11), Offset(10, 11)],
    "Prog 3": [Offset(10, 11),Offset(10, 11), Offset(10, 11)]
  };

  MyProgressScreen({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 2.0,
          title: Text("My Progress", style: TextStyle(color: Colors.black),),
          actions: [
            
            Image.network(
                "https://static.thenounproject.com/png/402637-200.png"),
            SizedBox(width: 10,)
          ]),
      body: ListView.builder(
        itemCount: progress.keys.length,
        itemBuilder: (contex, index) {
          var entryList = progress.entries.toList();

          return Card(
            elevation: 0.2,
            color: Color.fromARGB(0, 79, 79, 79),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: ListTile(
              title: Text(
                "${entryList[0].key}",
                style: TextStyle(color: Colors.white),
              ),
              leading: SizedBox(
                width: 50,
                height: 50,
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
