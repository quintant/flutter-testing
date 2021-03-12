// import 'dart:html';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/Drawer%20Widgets/Drawer.dart';
import 'package:myapp/Drawer%20Widgets/drawer_bar.dart';
import 'package:myapp/LoginScreen/login.dart';
import 'package:myapp/Main%20Body/SimpleBackground.dart';
import 'package:myapp/Main%20Body/background.dart';
import 'package:myapp/Main%20Body/bodyDefaultItem.dart';
import 'package:myapp/Main%20Body/spiningIcon.dart';
import 'package:http/http.dart';


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
          scaffoldBackgroundColor: Color.fromARGB(255, 70, 68, 68),
          textTheme: GoogleFonts.latoTextTheme(),
          appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 70, 68, 68),
            elevation: 4,
            centerTitle: true,
            titleTextStyle: TextStyle(fontSize: 60),
          ),
      ),
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
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(
          widget.title,
        ),

      ),
      body: Center(
          child: LoginX(

          ))
    );
  }
}
