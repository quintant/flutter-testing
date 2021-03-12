// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/Drawer%20Widgets/Drawer.dart';
import 'package:myapp/Drawer%20Widgets/drawer_bar.dart';
import 'package:myapp/Main%20Body/background.dart';
import 'package:myapp/Main%20Body/bodyDefaultItem.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yo is my website',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.transparent,
          canvasColor: Color.fromRGBO(0, 0, 0, 0)),
      home: MyHomePage(title: 'Welcome'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {


  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      MyBackground(),
      Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Container(
            alignment: Alignment.center,
            color: Colors.transparent,
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 40),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))),
          leading: DrawerBar(),
          backgroundColor: Colors.white70,
          elevation: 0,
        ),
        drawer: Theme(
            data: Theme.of(context),
            child: Drawer(
              child: myDrawer(),
            )),
        body: Container(
          padding: EdgeInsets.all(10),
          alignment: Alignment.topCenter,
          child: ListView(
            children: <Widget>[
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
              DefaultItem(),
            ],
          ),
        ),
      ),
    ]);
  }
}
