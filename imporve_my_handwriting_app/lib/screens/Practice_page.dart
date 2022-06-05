import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:imporve_my_handwriting_app/screens/My_Progress_page.dart';

// class Progress {
//   final String title;
//   final String offsets;

//   const Progress(this.title, this.offsets);
// }

class PracticePage extends StatefulWidget {
  final int style_index;

  PracticePage({Key? key, required this.style_index}) : super(key: key);

  @override
  State<PracticePage> createState() =>
      _PracticePageState(style_index: style_index);
}

class _PracticePageState extends State<PracticePage> {
  int style_index;

  _PracticePageState({Key? key, required this.style_index});

  List<Offset> points = [];
  final List<String> _list_of_writingStyles = [
    "Indie Flower",
    "Jura",
    "Kristi",
    "Marck Script",
    "Patrick Hand",
    "Permanenet Marker"
  ];

  Map<String, List<Offset>> progress = {};

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    const double fontsize = 100.0;
    TextStyle _writingStyle = TextStyle(
      letterSpacing: 1.5,
      color: Colors.white,
      fontSize: fontsize * 0.25,
      fontFamily: _list_of_writingStyles[style_index],
    );
    int _progressIndex = 0;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Practice"),
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
      body: Stack(
        children: <Widget>[
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
          Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Container(
                      // color: Colors.white,
                      width: screenWidth * 0.70,
                      height: screenHeight * 0.50 * 0.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Text(
                        "The quick brown fox jumps over the lazy dog.",
                        style: _writingStyle,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: screenWidth * 0.70, // Work out the Size
                      height: screenHeight *
                          0.50, // Work out the Height by subtracting the height of the appbar.
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              blurRadius: 6.0,
                              spreadRadius: 1.5,
                            )
                          ]),
                      child: GestureDetector(
                        onPanDown: (details) {
                          this.setState(() {
                            points.add(details.localPosition);
                          });
                        },
                        onPanUpdate: (details) {
                          this.setState(() {
                            points.add(details.localPosition);
                          });
                        },
                        onPanEnd: (details) {
                          this.setState(() {
                            points.add(Offset.zero);
                          });
                        },
                        child: SizedBox.expand(
                          child: ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                            child: CustomPaint(
                                size: Size(
                                    screenWidth * 0.70, screenHeight * 0.50),
                                isComplex: true,
                                willChange: true,
                                painter: CPainter(drawingpoints: points)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: screenWidth * 0.80,
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Row(
                      children: <Widget>[
                        Spacer(),
                        ElevatedButton.icon(
                            label: Text("Save"),
                            icon: Icon(
                              Icons.save,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent.withOpacity(0.1),
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              _progressIndex++;
                              progress["${_progressIndex}"] = points;
                              MyProgressScreen(
                                progress: progress,
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                    backgroundColor: Colors.blueAccent,
                                content: Text("Your Progress has been Saved!"),
                                duration: Duration(milliseconds: 500),
                              ));
                              this.setState(() {
                                points.clear();
                              });
                            }),
                        ElevatedButton.icon(
                            label: Text("Clear"),
                            icon: Icon(
                              Icons.layers_clear,
                              // color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent.withOpacity(0.1),
                              onPrimary: Colors.white,
                            ),
                            onPressed: () {
                              this.setState(() {
                                points.clear();
                              });
                            }),
                        Spacer(),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // drawer: Drawer(
      //   backgroundColor: Colors.blue,
      //   child: Container(
      //     decoration: const BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topRight,
      //         end: Alignment.bottomLeft,
      //         colors: [
      //           Colors.lightBlueAccent,
      //           Colors.lightBlue,
      //           Colors.blue,
      //           Colors.blueAccent,
      //           Colors.lightBlue,
      //         ],
      //       ),
      //     ),
      //     child: Column(
      //       children: [
      //         SizedBox(
      //           height: MediaQuery.of(context).size.height * 0.025,
      //         ),
      //         CircleAvatar(
      //           backgroundColor: Colors.white,
      //           radius: MediaQuery.of(context).size.height * 0.08,
      //           // backgroundImage: Image.asset('assets/images/circleAvatar.png') as ImageProvider,
      //         ),
      //         SizedBox(
      //           height: MediaQuery.of(context).size.height * 0.02,
      //         ),
      //         Container(
      //           color: Colors.transparent,
      //           height: MediaQuery.of(context).size.height * 0.7,
      //           width: MediaQuery.of(context).size.width,
      //           child: ListView.builder(
      //               itemCount: 6,
      //               itemBuilder: (context, index) {
      //                 return Column(
      //                   children: [
      //                     SizedBox(
      //                       height: 1,
      //                     ),
      //                     Card(
      //                       elevation: 0.2,
      //                       color: Color.fromARGB(0, 79, 79, 79),
      //                       shape: RoundedRectangleBorder(
      //                         borderRadius: BorderRadius.circular(15.0),
      //                       ),
      //                       child: ListTile(
      //                         title: Text(
      //                           "${index + 1}. ${_list_of_writingStyles[index]}",
      //                           style: TextStyle(color: Colors.white),
      //                           textAlign: TextAlign.start,
      //                         ),
      //                         leading: SizedBox(
      //                           width: 5,
      //                           height: 5,
      //                         ),
      //                         onTap: () {
      //                           // Go to Practice page.
      //                         },
      //                       ),
      //                     ),
      //                   ],
      //                 );
      //               }),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}

class CPainter extends CustomPainter {
  List<Offset> drawingpoints;

  CPainter({required this.drawingpoints});

  @override
  void paint(Canvas canvas, Size size) {
    Paint myBackground = Paint()..color = Colors.white;
    Rect myRect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(myRect, myBackground);
    canvas.clipRect(myRect);

    Paint paintObj = Paint();
    paintObj.color = Colors.black;
    paintObj.isAntiAlias = true;
    paintObj.strokeCap = StrokeCap.round;
    paintObj.strokeWidth = 2.5;

    for (int i = 0; i < drawingpoints.length; i++) {
      if (drawingpoints[i] != Offset.zero &&
          drawingpoints[i + 1] != Offset.zero) {
        canvas.drawLine(drawingpoints[i], drawingpoints[i + 1], paintObj);
      } else if (drawingpoints[i] != Offset.zero &&
          drawingpoints[i + 1] == Offset.zero) {
        canvas.drawPoints(PointMode.points, [drawingpoints[i]], paintObj);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
