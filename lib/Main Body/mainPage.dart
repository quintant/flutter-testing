import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/Bot/botMain.dart';
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

  Future<Guild> guild;
  String token;

  @override
  void initState() {
    super.initState();
    guild = fetchGuild(widget.token);
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
      ),
      body: Stack(
        children: [
          Container(
            child: ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  child: Text('Logout'),
                  color: Color.fromARGB(255, 70-colorChange, 68-colorChange, 68-colorChange),
                  onPressed: () => {
                    Navigator.pop(context),
                  },
                ),
                DarkButton(text: token)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

