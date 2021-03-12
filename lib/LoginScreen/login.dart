import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Main%20Body/mainPage.dart';
import 'package:myapp/MyPageRoute.dart';

class LoginX extends StatefulWidget {
  @override
  _LoginXState createState() => _LoginXState();
}

class _LoginXState extends State<LoginX> {
  final inpController = TextEditingController();

  @override
  void dispose() {
    inpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.3;
    int colorChange = 40;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Bot Login',
          textAlign: TextAlign.center,
          textScaleFactor: 2,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        Divider(color: Colors.transparent),
        Container(
          // height: width * 0.12,
          width: width,
          decoration: BoxDecoration(
              color: Colors.white70, borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.only(left: 10, right: 10),
          child: TextField(
            decoration:
                InputDecoration(hintText: 'Token', border: InputBorder.none),
            controller: inpController,
          ),
        ),
        ButtonBar(
          alignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
              child: Text('Quit'),
              color: Color.fromARGB(
                  255, 70 - colorChange, 68 - colorChange, 68 - colorChange),
              onPressed: () => exit(0),
            ),
            MaterialButton(
              child: Text('Login'),
              color: Color.fromARGB(
                  255, 70 + colorChange, 68 + colorChange, 68 + colorChange),
              onPressed: () {
                Navigator.push(
                    context,
                    FadeRoute(
                        page: MainPage(
                      token: inpController.text,
                    )));
              },
            )
          ],
        )
      ],
    );
  }
}
