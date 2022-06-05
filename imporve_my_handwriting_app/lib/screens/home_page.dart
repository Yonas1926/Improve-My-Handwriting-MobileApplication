import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> _writingStyles = ["Porcelain Sans Serif", "Little Day Font", 
    "Herbarium font", 
    "Selima Script", 
    "Balqis Font", 
    "Youngones_RS Font"];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Choose a writing style!"),
        leading: Icon(Icons.brush),
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
                        onTap: (){
                          // Go to Practice page.
                        },
                      ),
                    ),
                  ],
                );
              }),
        ]),
      ),
    );
    ;
  }
}
