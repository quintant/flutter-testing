import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/Bot/botMain.dart';
import 'package:myapp/Bot/classes/partialGuild.dart';
import 'package:myapp/Buttons/DarkButton.dart';
import 'package:myapp/Main%20Body/ServerListBuilder.dart';


class MainPage extends StatefulWidget {
  final String token;
  MainPage({Key key, @required this.token}) : super(key: key);
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final int colorChange = 40;

  String token;

  @override
  void initState() {
    super.initState();
    token = widget.token;
  }

  @override
  Widget build(BuildContext context) {
    // List<Guild> guilds = getGuildList(bot);
    // sleep(Duration(seconds: 10));
    return Scaffold(
      appBar: AppBar(
        title: Text('First Route'),
        automaticallyImplyLeading: false,
        leadingWidth: 100,
        leading: TextButton(
          child: Text('Logout'),
          onPressed: () => {
            Navigator.pop(context),
          },
        ),
      ),
      body: guildList(token),
    );
  }
}

