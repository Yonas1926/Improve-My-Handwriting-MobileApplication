import 'dart:ui';
import 'package:flutter/material.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({Key? key}) : super(key: key);

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Practice"),
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
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
                            // points.add(DrawingArea(
                            //     point: details.localPosition,
                            //     areaPaint: Paint()
                            //       ..strokeCap = StrokeCap.round
                            //       ..isAntiAlias = true
                            //       ..color = selectedColor
                            //       ..strokeWidth = strokeWidth));
                          });
                        },
                        onPanUpdate: (details) {
                          this.setState(() {
                            points.add(details.localPosition);
                            // points.add(DrawingArea(
                            //     point: details.localPosition,
                            //     areaPaint: Paint()
                            //       ..strokeCap = StrokeCap.round
                            //       ..isAntiAlias = true
                            //       ..color = selectedColor
                            //       ..strokeWidth = strokeWidth));
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
                                painter: MyCustomPainter(points: points)),
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
                              //color: selectedColor,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.blueAccent
                                  .withOpacity(0.1), //background color
                              onPrimary: Colors.white, //ripple color
                            ),
                            onPressed: () {
                              //selectColor();
                            }),

                        // Expanded(
                        //   child: Slider(
                        //     min: 1.0,
                        //     max: 5.0,
                        //     label: "Stroke $strokeWidth",
                        //     activeColor: selectedColor,
                        //     value: strokeWidth,
                        //     onChanged: (double value) {
                        //       this.setState(() {
                        //         strokeWidth = value;
                        //       });
                        //     },
                        //   ),
                        // ),
                        Spacer(),
                        ElevatedButton.icon(
                            label: Text("Clear"),
                            icon: Icon(
                              Icons.layers_clear,
                              // color: Colors.black,
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: Colors.purpleAccent
                                  .withOpacity(0.1), //background color
                              onPrimary: Colors.white, //ripple color
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
    );
  }
}

class MyCustomPainter extends CustomPainter {
  List<Offset> points;

  MyCustomPainter({required this.points});

  @override
  void paint(Canvas canvas, Size size) {
    Paint background = Paint()..color = Colors.white;
    Rect rect = Rect.fromLTWH(0, 0, size.width, size.height);
    canvas.drawRect(rect, background);
    canvas.clipRect(rect);

    Paint paint = Paint();
    paint.color = Colors.black;
    paint.isAntiAlias = true;
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = 2.5;

    for (int i = 0; i < points.length; i++) {
      if (points[i] != Offset.zero && points[i + 1] != Offset.zero) {
        canvas.drawLine(points[i], points[i + 1], paint);
      } else if (points[i] != Offset.zero && points[i + 1] == Offset.zero) {
        canvas.drawPoints(PointMode.points, [points[i]], paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
