import 'package:flutter/material.dart';

class SpinningIcon extends StatefulWidget {
  @override
  _SpinningIconState createState() => _SpinningIconState();
}

class _SpinningIconState extends State<SpinningIcon> with SingleTickerProviderStateMixin {
  int index = 0;
  Color bottomColor = Colors.blue;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  void change() {
    setState(() {
      index = index + 1;
    });
  }

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.repeat();
  }

  @override
  void dispose() {
    controller.stop();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(controller),
        child: Icon(
          Icons.audiotrack,
          color: Colors.pink,
          size: 100,
        )
      ),
    );
  }
}
