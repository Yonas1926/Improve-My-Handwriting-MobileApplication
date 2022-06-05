import 'package:flutter/material.dart';
import 'package:imporve_my_handwriting_app/screens/home_page.dart';

class Log_in_screen extends StatelessWidget {
  final double fontSize = 100.0;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Stack(alignment: AlignmentDirectional.center, children: [
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
          Log_in_box(screenWidth, screenHeight),
        ]),
      ),
      
    );
  }

  Container Log_in_box(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.65,
      height: screenHeight * 0.7,
      child: Padding(
        padding: const EdgeInsets.all(0.4),
        child: Container(
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.025,
                vertical: screenHeight * 0.02,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Log In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: fontSize * 0.2,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  emailBox(screenWidth, screenHeight, fontSize),
                  SizedBox(
                    height: 10,
                  ),
                  passwordBox(screenWidth, screenHeight, fontSize),
                  SizedBox(
                    height: 10,
                  ),
                  signInAsInstructor(),
                  log_In_Button(screenWidth, screenHeight, fontSize),
                ],
              ),
            ),
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.purple,
              ],
            ),
          ),
        ),
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 48, 48, 48),
            blurRadius: 15.0,
            spreadRadius: 1.0,
            offset: Offset(
              5.0,
              5.0,
            ),
          )
        ],
      ),
    );
  }
}

Column emailBox(screenWidth, screenHeight, fontSize) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize * 0.16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ]),
          height: screenHeight * 0.08,
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: screenHeight * 0.02),
              prefixIcon: Icon(
                Icons.email,
                color: Colors.blue,
              ),
              hintText: "Your Email",
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ]);
}

Column passwordBox(screenWidth, screenHeight, fontSize) {
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
            color: Colors.white,
            fontSize: fontSize * 0.16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 6,
                  offset: Offset(0, 2),
                ),
              ]),
          height: screenHeight * 0.08,
          child: TextField(
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: screenHeight * 0.02),
              prefixIcon: Icon(
                Icons.lock_rounded,
                color: Colors.blue,
              ),
              hintText: "Your Password",
              hintStyle: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ),
      ]);
}

Container log_In_Button(screenWidth, screenHeight, fontSize) {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 25),
    width: screenWidth * 0.3,
    height: fontSize - 20,
    child: ElevatedButton(
      onPressed: () {
        MaterialPage(
            child: HomeScreen(didSelectStyle: (value) {},),
          );
      },
      child: Text("Log In"),
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
    ),
  );
}

Container signInAsInstructor() {
  return Container(
    alignment: Alignment.centerRight,
    child: TextButton(
      onPressed: () {},
      child: Text(
        "or sign in as Instructor.",
        softWrap: true,
        style: TextStyle(
          color: Colors.white,
          decoration: TextDecoration.underline,
          fontStyle: FontStyle.italic,
        ),
      ),
    ),
  );
}
