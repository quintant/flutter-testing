import 'package:flutter/material.dart';

class DarkButton extends StatefulWidget {
  final String text;

  DarkButton({Key key, @required this.text}) : super(key: key);

  @override
  _DarkButtonState createState() => _DarkButtonState();
}

class _DarkButtonState extends State<DarkButton> {
  int colorChange = 40;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(widget.text),
      color: Color.fromARGB(255, 70-colorChange, 68-colorChange, 68-colorChange),
      onPressed: () => {
        Navigator.pop(context)
      },
    );
  }
}
