import 'package:flutter/material.dart';


class MyBackground extends StatefulWidget {
  @override
  _MyBackgroundState createState() => _MyBackgroundState();
}

class _MyBackgroundState extends State<MyBackground> with SingleTickerProviderStateMixin {
  List<Color> colorList = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow
  ];
  int index = 0;
  Color bottomColor = Colors.blue;
  Color topColor = Colors.yellow;
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;

  void change() {
    setState(() {
      index = index + 1;
      bottomColor = colorList[index % colorList.length];
      topColor = colorList[(index + 1) % colorList.length];
    });
  }

  Animation<double> animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(milliseconds: 2), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        setState(() {
          change();
        });
      });
    controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      onEnd: () => change(),
      curve: Curves.linear,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin, end: end, colors: [bottomColor, topColor]
        )
      ),

    );
  }
}
