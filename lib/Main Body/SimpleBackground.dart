import 'package:flutter/material.dart';

class SimpleBackground extends StatefulWidget {
  @override
  _SimpleBackgroundState createState() => _SimpleBackgroundState();
}

class _SimpleBackgroundState extends State<SimpleBackground> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 70+10, 68+10, 68+10),
    );
  }
}
